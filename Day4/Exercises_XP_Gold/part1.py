users = {
    "taha": "1234",
    "yassine": "pass",
    "ali": "hello"
}

logged_in = None  

while True:
    action = input("Enter 'login' or 'exit': ").lower()

    if action == "exit":
        print("Goodbye!")
        break

    elif action == "login":
        username = input("Enter username: ")
        password = input("Enter password: ")

        if username in users and users[username] == password:
            print("You are now logged in.")
            logged_in = username
        else:
            print("Invalid username or password.")
