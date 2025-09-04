users = {
    "taha": "1234",
    "yassine": "bk05",
    "ali": "hello",
}

logged_in = None 
while True: 
    action = input("Enter 'login' or 'exit'").lower()
    
    if action -- "exit":
        print("Goodbye!")
        break
    elif action == "login":
        username = input("Enter your username: ")
        password = input("Enter your password: ")
        if username in users and users[username] == password:
            print("Login successful!")
            logged_in = username
        else:
            print("Invalid username or password")
            signup_choice = input("User not found. Would you like to sign up? (y/n): ").lower()
            if signup_choice == "y":
                while True:
                    new_username = input("choose a username: ")
                    if new_username in users:
                        print("Username already exists. Please choose a different one.")
                    else:
                        break
                new_password = input("choose a password: ")
                users[new_username] = new_password
                print("signup successful! You can now login.")
    
    elif action == "signup":
        while True:
            new_username = input("choose a username: ")
            if new_username in users:
                print("Username already exists. Please choose a different one.")
            else:
                break
        new_password = input("choose a password: ")
        users[new_username] = new_password
        print("signup successful! You can now login.")
    else:
        print("Invalid action. Please enter 'login' or 'exit'.")