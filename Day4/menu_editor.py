import psycopg2

HOSTNAME = 'localhost'
USERNAME = 'postgres'
PASSWORD = 'Taha'
DATABASE = 'restaurant'

class MenuItem:
    def __init__(self, name, price):
        self.item_name = name
        self.item_price = price

    def save(self):
        try:
            connection = psycopg2.connect(
                host=HOSTNAME, user=USERNAME, password=PASSWORD, dbname=DATABASE
            )
            cursor = connection.cursor()
            cursor.execute(
                "INSERT INTO Menu_Items (item_name, item_price) VALUES (%s, %s)",
                (self.item_name, self.item_price)
            )
            connection.commit()
            print(f"{self.item_name} was added successfully.")
        except Exception as e:
            print(f"Error saving item: {e}")
        finally:
            if connection:
                connection.close()

    def delete(self):
        try:
            connection = psycopg2.connect(
                host=HOSTNAME, user=USERNAME, password=PASSWORD, dbname=DATABASE
            )
            cursor = connection.cursor()
            cursor.execute(
                "DELETE FROM Menu_Items WHERE item_name = %s",
                (self.item_name,)
            )
            connection.commit()
            print(f"{self.item_name} was deleted successfully.")
        except Exception as e:
            print(f"Error deleting item: {e}")
        finally:
            if connection:
                connection.close()

    def update(self, new_name, new_price):
        try:
            connection = psycopg2.connect(
                host=HOSTNAME, user=USERNAME, password=PASSWORD, dbname=DATABASE
            )
            cursor = connection.cursor()
            cursor.execute(
                "UPDATE Menu_Items SET item_name = %s, item_price = %s WHERE item_name = %s",
                (new_name, new_price, self.item_name)
            )
            connection.commit()
            print(f"{self.item_name} updated to {new_name} ({new_price} MAD).")
        except Exception as e:
            print(f"Error updating item: {e}")
        finally:
            if connection:
                connection.close()

class MenuManager:

    @classmethod
    def get_by_name(cls, name):
        try:
            connection = psycopg2.connect(
                host=HOSTNAME, user=USERNAME, password=PASSWORD, dbname=DATABASE
            )
            cursor = connection.cursor()
            cursor.execute("SELECT * FROM Menu_Items WHERE item_name = %s", (name,))
            item = cursor.fetchone()
            return item
        except Exception as e:
            print(f"Error fetching item: {e}")
            return None
        finally:
            if connection:
                connection.close()

    @classmethod
    def all_items(cls):
        try:
            connection = psycopg2.connect(
                host=HOSTNAME, user=USERNAME, password=PASSWORD, dbname=DATABASE
            )
            cursor = connection.cursor()
            cursor.execute("SELECT * FROM menu_items;")
 
            items = cursor.fetchall()
            return items
        except Exception as e:
            print(f"Error fetching all items: {e}")
            return []
        finally:
            if connection:
                connection.close()


def create_table_and_populate():
    try:
        connection = psycopg2.connect(
            host=HOSTNAME, user=USERNAME, password=PASSWORD, dbname=DATABASE
        )
        cursor = connection.cursor()

        cursor.execute("""
            CREATE TABLE IF NOT EXISTS Menu_Items (
                item_id SERIAL PRIMARY KEY,
                item_name VARCHAR(30) NOT NULL,
                item_price SMALLINT DEFAULT 0
            );
        """)
        connection.commit()
 
        cursor.execute("SELECT COUNT(*) FROM Menu_Items;")
        if cursor.fetchone()[0] == 0:
            cursor.execute("""
                INSERT INTO Menu_Items (item_name, item_price) VALUES
                ('Burger', 35),
                ('Pizza', 50),
                ('Pasta', 45),
                ('Salad', 25);
            """)
            connection.commit()
            print("Default menu items added.")
    except Exception as e:
        print(f"Error: {e}")
    finally:
        if connection:
            connection.close()


def show_user_menu():
    while True:
        choice = input("""
Restaurant Menu Manager

(V) View an Item
(A) Add an Item
(D) Delete an Item
(U) Update an Item
(S) Show the Menu
(Q) Quit

Enter choice: """).upper()

        if choice == "V":
            name = input("Enter item name: ")
            item = MenuManager.get_by_name(name)
            print(item if item else "Item not found.")

        elif choice == "A":
            add_item_to_menu()

        elif choice == "D":
            remove_item_from_menu()

        elif choice == "U":
            update_item_from_menu()

        elif choice == "S":
            show_restaurant_menu()

        elif choice == "Q":
            print("Exiting... Final Menu:")
            show_restaurant_menu()
            break
        else:
            print("Invalid choice, try again.")

def add_item_to_menu():
    name = input("Enter new item name: ")
    price = int(input("Enter price: $"))
    item = MenuItem(name, price)
    item.save()

def remove_item_from_menu():
    name = input("Enter item name to delete: ")
    item = MenuItem(name, 0)
    item.delete()

def update_item_from_menu():
    old_name = input("Enter current item name: ")
    new_name = input("Enter new item name: ")
    new_price = int(input("Enter new price: $"))
    item = MenuItem(old_name, 0)
    item.update(new_name, new_price)

def show_restaurant_menu():
    items = MenuManager.all_items()
    if items:
        print("\nRestaurant Menu:")
        for i in items:
            print(f"{i[0]}. {i[1]} - {i[2]} MAD")
    else:
        print("Menu is empty.")


if __name__ == "__main__":
    create_table_and_populate()
    show_user_menu()
    