# AI-ChatBot (Flask + XAMPP MySQL)

This project is a **Flask-based AI Chat Assistant** with:
- A **chat popup frontend** (HTML/JS in `templates/index.html`)
- A **Flask backend API** (`app.py`)
- A **MySQL database** (XAMPP), exported in `/db/start_ai_chatbot.sql`

---

## 🚀 Features
- User-specific chat sessions stored in MySQL
- AI-powered responses via OpenRouter API
- Session history (rename, delete, persist in DB)
- FAQ system filtered by user type (startup, investor, mentor)
- Clean frontend popup chat (with chat + FAQ tabs)

---

## 🛠️ Prerequisites
- [Python 3.8+](https://www.python.org/downloads/)
- [XAMPP (MySQL + Apache)](https://www.apachefriends.org/download.html)
- [Git](https://git-scm.com/downloads)

---

## 📂 Project Structure

```
ai_chat_project/
│── app.py # Flask backend
│── templates/
│ └── index.html # Frontend chat popup
│── db/
│ └── start_ai_chatbot.sql # MySQL DB export
│── requirements.txt
│── README.md
│── .gitignore
```

---

## ⚙️ Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/YOUR_USERNAME/ai_chat_assistant.git
cd ai_chat_assistant
```

### 2. Create Virtual Environment & Install Dependencies
```
python -m venv venv
# Activate virtual environment
venv\Scripts\activate      # Windows
source venv/bin/activate   # Mac/Linux

# Install dependencies
pip install -r requirements.txt
```

### 3. Setup MySQL Database (XAMPP)

Start Apache and MySQL in XAMPP.

1. Open http://localhost/phpmyadmin.
2. Create a new database named:
3. start_ai_chatbot
4. Go to Import → Select db/start_ai_chatbot.sql → Click Go.
✅ This will create all tables (users, ai_chat_history, ai_faqs_Q, ai_faqs_A) with sample data if included.

### 4. Configure Database Connection

By default, app.py uses:
```
conn = mysql.connector.connect(
    host="localhost",
    user="root",      # default XAMPP user
    password="",      # leave empty unless you set a password
    database="start_ai_chatbot"
)
```
👉 If you set a MySQL password, update password="yourpassword" in app.py.

### 5. Run Flask Application
```
python app.py
```
Server will start at:
```
http://127.0.0.1:5000
```
### 6. Open Frontend
Visit http://127.0.0.1:5000
You’ll see the chat popup (💬 button in bottom-right).

### 📥 Re-importing Database Later
If you reinstall or move the project:
1. Start MySQL in XAMPP
2. Open phpMyAdmin → Create start_ai_chatbot DB
3. Import db/start_ai_chatbot.sql

### 📝 Notes

1. Do not upload venv/ or .db files (already ignored in .gitignore).
2. Database schema is fully contained in db/start_ai_chatbot.sql.
3. Update OPENROUTER_API_KEY inside app.py with your valid key.
