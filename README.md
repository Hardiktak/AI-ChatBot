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
ai_chat_project/
│── app.py # Flask backend
│── templates/
│ └── index.html # Frontend chat popup
│── db/
│ └── start_ai_chatbot.sql # MySQL DB export
│── requirements.txt
│── README.md
│── .gitignore


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
