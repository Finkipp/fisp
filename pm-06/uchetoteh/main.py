import tkinter as tk
from tkinter import messagebox, simpledialog, scrolledtext
from tkinter import ttk
import tempfile
import os
import sqlite3
from reportlab.lib import colors
from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle
import win32api
import win32print
import markdown2
import webbrowser


# Функции для работы с базой данных
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

def add_equipment():
    name = simpledialog.askstring("Добавить технику", "Наименование:")
    type_ = simpledialog.askstring("Добавить технику", "Тип техники:")
    manufacturer = simpledialog.askstring("Добавить технику", "Производитель:")
    purchase_date = simpledialog.askstring("Добавить технику", "Дата покупки:")
    warranty_end = simpledialog.askstring("Добавить технику", "Срок окончания гарантии:")
    status = simpledialog.askstring("Добавить технику", "Статус:")

    if all([name, type_, manufacturer, purchase_date, warranty_end, status]):
        connection = sqlite3.connect('equipment.db')
        cursor = connection.cursor()
        cursor.execute("INSERT INTO equipment (name, type, manufacturer, purchase_date, warranty_end, status) VALUES (?, ?, ?, ?, ?, ?)",
                       (name, type_, manufacturer, purchase_date, warranty_end, status))
        connection.commit()
        connection.close()
        refresh_table()
    else:
        messagebox.showerror("Ошибка", "Пожалуйста, заполните все поля.")

def update_status():
    selected_item = treeview.focus()
    if selected_item:
        equipment_id = treeview.item(selected_item, 'values')[0]
        new_status = simpledialog.askstring("Изменить статус", "Новый статус:")
        if new_status:
            connection = sqlite3.connect('equipment.db')
            cursor = connection.cursor()
            cursor.execute("UPDATE equipment SET status = ? WHERE id = ?", (new_status, equipment_id))
            connection.commit()
            connection.close()
            refresh_table()
        else:
            messagebox.showerror("Ошибка", "Статус не может быть пустым.")
    else:
        messagebox.showerror("Ошибка", "Выберите технику для изменения статуса.")

def refresh_table():
    for item in treeview.get_children():
        treeview.delete(item)

    connection = sqlite3.connect('equipment.db')
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM equipment")
    equipment_list = cursor.fetchall()
    connection.close()

    for equipment in equipment_list:
        treeview.insert("", tk.END, values=equipment)

def print_report():
    report = "Отчет по технике:\n\n"
    report += f"{'ID':<5} {'Наименование':<30} {'Тип техники':<20} {'Производитель':<20} {'Дата покупки':<15} {'Срок гарантии':<15} {'Статус':<10}\n"
    report += "-" * 115 + "\n"

    connection = sqlite3.connect('equipment.db')
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM equipment")
    equipment_list = cursor.fetchall()
    connection.close()

    for equipment in equipment_list:
        report += f"{equipment[0]:<5} {equipment[1]:<30} {equipment[2]:<20} {equipment[3]:<20} {equipment[4]:<15} {equipment[5]:<15} {equipment[6]:<10}\n"

    # Открываем новое окно для вывода отчета
    report_window = tk.Toplevel(root)
    report_window.title("Отчет")
    report_text = scrolledtext.ScrolledText(report_window, width=150, height=30)
    report_text.pack(padx=10, pady=10)
    report_text.insert(tk.END, report)
    report_text.config(state=tk.DISABLED)  # Предотвращаем редактирование текста

# Создание основного окна
root = tk.Tk()
root.title("Учёт компьютерной техники")

# Создание таблицы с заголовками
columns = ("ID", "Наименование", "Тип", "Производитель", "Дата покупки", "Гарантия до", "Статус")
treeview = ttk.Treeview(root, columns=columns, show='headings')
treeview.pack(padx=10, pady=10)

# Настройка заголовков
for col in columns:
    treeview.heading(col, text=col)
    treeview.column(col, anchor=tk.W, width=100)  # Установим оптимальную ширину для каждого столбца

# Кнопки
button_frame = tk.Frame(root)
button_frame.pack(pady=10)

add_button = tk.Button(button_frame, text="Добавить технику", command=add_equipment)
add_button.pack(side=tk.LEFT, padx=5)

status_button = tk.Button(button_frame, text="Изменить статус", command=update_status)
status_button.pack(side=tk.LEFT, padx=5)

print_button = tk.Button(button_frame, text="Печать", command=print_report)
print_button.pack(side=tk.LEFT, padx=5)

def open_help_file():
    # Открываем файл помощи
    file_path = 'help.txt'
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()

        # Открываем новое окно для отображения контента
        help_window = tk.Toplevel()
        help_window.title("Руководство пользователя")
        text_widget = tk.Text(help_window, wrap="word")
        text_widget.pack(fill="both", expand=True)
        text_widget.insert(tk.END, content)
        text_widget.configure(state="disabled")  # Делаем текст доступным только для чтения

    except FileNotFoundError:
        messagebox.showerror('Ошибка', f'Файл {file_path} не найден.')

def open_op_file():
    # Открываем файл помощи
    file_path = 'ops.txt'
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()

        # Открываем новое окно для отображения контента
        op_window = tk.Toplevel()
        op_window.title("Руководство оператора")
        text_widget = tk.Text(op_window, wrap="word")
        text_widget.pack(fill="both", expand=True)
        text_widget.insert(tk.END, content)
        text_widget.configure(state="disabled")  # Делаем текст доступным только для чтения

    except FileNotFoundError:
        messagebox.showerror('Ошибка', f'Файл {file_path} не найден.')

# Меню
menu = tk.Menu(root)
root.config(menu=menu)

file_menu = tk.Menu(menu)
menu.add_cascade(label="Файл", menu=file_menu)
file_menu.add_command(label="Добавить технику", accelerator="Ctrl+A", command=add_equipment)
file_menu.add_command(label="Изменить статус", accelerator="Ctrl+R", command=update_status)
file_menu.add_command(label="Печать", accelerator="Ctrl+P", command=print_report)

help_menu = tk.Menu(menu)
menu.add_cascade(label="Справка", menu=help_menu)
help_menu.add_command(label="Руководство пользователя", command=open_help_file)
help_menu.add_command(label="Руководство оператора", command=open_op_file)
help_menu.add_command(label="О программе", command=lambda: messagebox.showinfo("О программе", "Учёт компьютерной техники\n\nАвтор: Пивоваров Филипп"))

# Горячие клавиши
root.bind('<Control-a>', lambda event: add_equipment())
root.bind('<Control-r>', lambda event: update_status())
root.bind('<Control-p>', lambda event: print_report())

# Обновление таблицы
create_database()  # Убедимся, что база данных создана перед запуском
refresh_table()
root.mainloop()