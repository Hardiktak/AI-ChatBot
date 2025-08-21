from flask import Flask, request, jsonify, render_template
from flask_cors import CORS
import mysql.connector
from mysql.connector import Error
import requests, json
from datetime import datetime

# --- Flask Setup ---
app = Flask(__name__, static_folder="static", template_folder="templates")
CORS(app)

# --- Configuration ---
OPENROUTER_API_KEY = "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"   # replace with your OpenRouter key
OPENROUTER_URL = "https://openrouter.ai/api/v1/chat/completions"
MODEL = "openai/gpt-3.5-turbo"

# --- MySQL Connection ---
def get_db_connection():
    try:
        conn = mysql.connector.connect(
            host="localhost",        # XAMPP default
            user="root",             # change if you set another user
            password="",             # set your MySQL password if any
            database="start_ai_chatbot"
        )
        return conn
    except Error as e:
        print("MySQL Connection Error:", e)
        return None

# --- Chat History Functions ---
def save_message(session_id, user_id, role, content):
    conn = get_db_connection()
    if not conn:
        return
    cursor = conn.cursor()

    cursor.execute("SELECT details FROM ai_chat_history WHERE session_id=%s AND user_id=%s", (session_id, user_id))
    row = cursor.fetchone()

    if row:
        # Update existing session
        details = json.loads(row[0])
        details["messages"].append({"role": role, "content": content})
        cursor.execute("""
            UPDATE ai_chat_history 
            SET details=%s, last_updated=%s 
            WHERE session_id=%s AND user_id=%s
        """, (json.dumps(details), datetime.now(), session_id, user_id))
    else:
        # Create new session
        details = {"messages": [{"role": role, "content": content}]}
        cursor.execute("""
            INSERT INTO ai_chat_history (user_id, session_id, details) 
            VALUES (%s, %s, %s)
        """, (user_id, session_id, json.dumps(details)))

    conn.commit()
    cursor.close()
    conn.close()

def get_recent_messages(session_id, user_id, limit=10):
    conn = get_db_connection()
    if not conn:
        return []
    cursor = conn.cursor()
    cursor.execute("SELECT details FROM ai_chat_history WHERE session_id=%s AND user_id=%s", (session_id, user_id))
    row = cursor.fetchone()
    cursor.close()
    conn.close()

    if not row:
        return []

    details = json.loads(row[0])
    return details["messages"][-limit:]

# --- System Prompt Generator ---
def generate_system_prompt(user_info):
    if user_info.get("user_type") == "startup":
        return (f"You are chatting with a startup named {user_info.get('name')}. "
                f"Description: {user_info.get('description')}. "
                f"Type: {user_info.get('startup_type')}, Stage: {user_info.get('stage')}.")
    elif user_info.get("user_type") == "investor":
        return (f"You are chatting with an investor named {user_info.get('name')}. "
                f"Description: {user_info.get('description')}. "
                f"Investor Type: {user_info.get('investor_type')}, Preferred Sectors: {user_info.get('sectors')}.")
    else:
        return (f"You are chatting with a mentor named {user_info.get('name')}. "
                f"Description: {user_info.get('description')}. "
                f"Expertise: {user_info.get('expertise')}, Years of experience: {user_info.get('experience_years')}.")

# --- Routes ---
@app.route("/")
def index():
    return render_template("index.html")

# --- Chat API ---
# @app.route('/chat', methods=['POST'])
# def chat():
#     data = request.get_json(force=True)
#     session_id = data.get("session_id")
#     user_id = data.get("user_id", 1)   # default user_id = 1 if not provided
#     user_info = data.get("user_info")
#     query = data.get("query")

#     if not session_id or not user_info or not query:
#         return jsonify({"error": "Missing data"}), 400

#     # Save system prompt if new session
#     recent = get_recent_messages(session_id, user_id)
#     if not recent:
#         save_message(session_id, user_id, "system", generate_system_prompt(user_info))

#     # Save user query
#     save_message(session_id, user_id, "user", query)

#     messages = get_recent_messages(session_id, user_id)

#     payload = {"model": MODEL, "messages": messages}
#     headers = {"Authorization": f"Bearer {OPENROUTER_API_KEY}", "Content-Type": "application/json"}

#     try:
#         r = requests.post(OPENROUTER_URL, headers=headers, json=payload, timeout=60)
#         r.raise_for_status()
#         reply = r.json()['choices'][0]['message']['content']
#         save_message(session_id, user_id, "assistant", reply)
#         return jsonify({"response": reply})
#     except requests.RequestException as e:
#         return jsonify({"error": str(e)}), 502

@app.route('/chat', methods=['POST'])
def chat():
    data = request.get_json(force=True)
    session_id = data.get("session_id")
    user_id = data.get("user_id")
    query = data.get("query")

    if not session_id or not user_id or not query:
        return jsonify({"error": "Missing data"}), 400

    # --- Fetch user info from DB ---
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT user_id, user_type, name, startup_name, description, industry_type
        FROM users WHERE user_id = %s
    """, (user_id,))
    user_info = cursor.fetchone()
    cursor.close()
    conn.close()

    if not user_info:
        return jsonify({"error": "User not found"}), 404

    # --- Save system prompt if new session ---
    recent = get_recent_messages(session_id, user_id)
    if not recent:
        system_prompt = (
            f"You are chatting with a {user_info['user_type']} named {user_info['name']}.\n"
            f"Startup Name: {user_info.get('startup_name', 'N/A')}\n"
            f"Description: {user_info.get('description', 'N/A')}\n"
            f"Industry: {user_info.get('industry_type', 'N/A')}."
        )
        save_message(session_id, user_id, "system", system_prompt)

    # Save user query
    save_message(session_id, user_id, "user", query)

    # Get last 10 messages
    messages = get_recent_messages(session_id, user_id)

    # --- Call OpenRouter API ---
    payload = {"model": MODEL, "messages": messages}
    headers = {
        "Authorization": f"Bearer {OPENROUTER_API_KEY}",
        "Content-Type": "application/json"
    }

    try:
        r = requests.post(OPENROUTER_URL, headers=headers, json=payload, timeout=60)
        r.raise_for_status()
        reply = r.json()['choices'][0]['message']['content']
        save_message(session_id, user_id, "assistant", reply)
        return jsonify({"response": reply})
    except requests.RequestException as e:
        return jsonify({"error": str(e)}), 502


# --- FAQ API ---
@app.route('/faqs', methods=['GET'])
def get_faqs():
    user_type = request.args.get("type")
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    if user_type:
        cursor.execute("""
            SELECT q.id as q_id, q.faq_Q as question, a.faq_A as answer 
            FROM ai_faqs_Q q
            JOIN ai_faqs_A a ON q.id = a.Q_id
            WHERE q.type=%s AND q.removed='n' AND a.removed='n'
        """, (user_type,))
    else:
        cursor.execute("""
            SELECT q.id as q_id, q.faq_Q as question, a.faq_A as answer 
            FROM ai_faqs_Q q
            JOIN ai_faqs_A a ON q.id = a.Q_id
            WHERE q.removed='n' AND a.removed='n'
        """)

    rows = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(rows)

# --- Delete Chat API ---
@app.route('/delete_chat', methods=['POST'])
def delete_chat():
    data = request.get_json(force=True)
    session_id = data.get("session_id")
    user_id = data.get("user_id", 1)

    if not session_id:
        return jsonify({"error": "Missing session_id"}), 400

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM ai_chat_history WHERE session_id=%s AND user_id=%s", (session_id, user_id))
    conn.commit()
    cursor.close()
    conn.close()

    return jsonify({"message": f"Chat {session_id} deleted."}), 200

# --- Rename Chat API (optional: store title inside JSON) ---
@app.route('/rename_chat', methods=['POST'])
def rename_chat():
    data = request.get_json(force=True)
    session_id = data.get("session_id")
    user_id = data.get("user_id", 1)
    new_name = data.get("new_name")

    if not session_id or not new_name:
        return jsonify({"error": "Missing data"}), 400

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT details FROM ai_chat_history WHERE session_id=%s AND user_id=%s", (session_id, user_id))
    row = cursor.fetchone()

    if not row:
        cursor.close()
        conn.close()
        return jsonify({"error": "Chat not found"}), 404

    details = json.loads(row[0])
    details["title"] = new_name

    cursor.execute("UPDATE ai_chat_history SET details=%s, last_updated=%s WHERE session_id=%s AND user_id=%s",
                   (json.dumps(details), datetime.now(), session_id, user_id))
    conn.commit()
    cursor.close()
    conn.close()

    return jsonify({"message": f"Chat {session_id} renamed to '{new_name}'."})




# --- Run ---
if __name__ == '__main__':
    app.run(debug=True)
