import sqlite3

def create_database():
    connection = sqlite3.connect('equipment.db')
    cursor = connection.cursor()

    cursor.execute('''CREATE TABLE IF NOT EXISTS equipment (
                        id INTEGER PRIMARY KEY AUTOINCREMENT,
                        name TEXT NOT NULL,
                        type TEXT NOT NULL,
                        manufacturer TEXT NOT NULL,
                        purchase_date TEXT NOT NULL,
                        warranty_end TEXT NOT NULL,
                        status TEXT NOT NULL)''')

    connection.commit()
    connection.close()

create_database()
