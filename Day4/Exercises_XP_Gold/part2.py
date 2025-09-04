# Part 2 : Authentication CLI - Login + Signup
users = {
    "taha": "1234",
    "yassine": "pass",
    "ali": "hello"
}
logged_in = None
while True:
    action = input("Enter 'login' or 'signup' or 'exit': ").lower()
    if action == "exit":
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
    elif action == "signup":
        while True:
            new_username = input("Enter a new username: ")
            if new_username in users:
                print("Username already exists. Please choose a different one.")
            else:
                break
        new_password = input("choose a password: ")
        users[new_username] = new_password
        print("Signup successful! You can now login. ")
    
    else:
        print("Invalid command. ")        