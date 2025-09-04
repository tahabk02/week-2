import requests
import sqlite3
import random
url = "https://restcountries.com/v3.1/all?fields=name,capital,flags,subregion,population"
response = requests.get(url)
if response.status_code != 200:
    print(" Failed to fetch countries from API")
    exit()
countries = response.json()    
print(f"Retrieved {len(countries)} countries from API")
random_countries = random.sample(countries, 10)
conn = sqlite3.connect("countries.db")
cursor = conn.cursor()
# create table
cursor.execute("""CREATE TABLE IF NOT EXISTS countries(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    capital TEXT,
    flag TEXT,
    subregion TEXT,
    population INTEGER
)
""")
conn.commit()
for country in random_countries:
    name = country.get("name", {}).get("common", "Unknown")
    capital = country.get("capital", ["Unknown"])[0] if country.get("capital") else "Unknown"
    flag = country.get("flags", {}).get("png", "Unknown")
    subregion = country.get("subregion", "Unknown")
    population = country.get("population", 0) 
    cursor.execute("""
    INSERT INTO countries (name, capital, flag, subregion, population)
    VALUES (?, ?, ?, ?, ?)
    """, (name, capital, flag, subregion, population)) 
conn.commit()
conn.close()
print("Successfully inserted 10 random countries into database (countries.db)")    