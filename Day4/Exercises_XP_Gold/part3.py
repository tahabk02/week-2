# Part 3 : Authentication CLI with Database + Password Encryption

import sqlite3
import hashlib

# ----------------------- Database Setup -------------------------
conn = sqlite3.connect("auth.db")
cursor = conn.cursor()

cursor.execute("""
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE,
    password TEXT               
)
""")
conn.commit()

# ============= Helpers ==============
def hash_password(password: str) -> str:
    """Encrypt password with SHA256"""
    return hashlib.sha256(password.encode()).hexdigest()
    
# ============= Signup ================
def signup():
    while True:
        username = input("choose a username: ").strip()
        cursor.execute("SELECT * FROM users WHERE username = ?", (username,))
        if cursor.fetchone():
            print("Username already exists, try another one.")
        else:
            break
    
    password = input("Choose a password: ").strip()
    hashed = hash_password(password)
    cursor.execute("INSERT INTO users (username, password) VALUES (?, ?)", (username, hashed)) 
    conn.commit()
    print("Signup successful! You can now login. ")
    
#-------------- Login --------------------
def login():
    username = input("Enter username: ").strip()
    password = input("Enter password: ").strip()
    hashed = hash_password(password)
    
    cursor.execute("SELECT * FROM users WHERE username = ? AND password = ?", (username, hashed))
    if cursor.fetchone():
        print(f"You are now logged in nas {username}.")
        return username
    else:
        print("Invalid username or password. ")
        return None 
            #---------------------------------------
def main():
    logged_in = None
    
    while True:
        action = input("\nEnter 'login', 'signup' or 'exit': ").lower()  
        
        if action == "exit":
            print("Goodbye!")
            break
        elif action == "login":
            logged_in = login()
        elif action == "signup":
            signup()
            
        else:
            print("Invalid command. Please type 'login', 'signup', or 'exit'.") 
    conn.close()
    
if __name__ =="__main__":
    main()               
        