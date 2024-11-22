import unittest
from unittest.mock import patch
from tkinter import messagebox
from main import add_equipment

class TestAddEquipment(unittest.TestCase):
    @patch('tkinter.simpledialog.askstring')
    def test_add_equipment(self, mock_askstring):
        mock_askstring.side_effect = ['Computer1', 'Type1', 'Manufacturer1', '2022-01-01', '2023-01-01', 'in work']
        add_equipment()
        mock_askstring.assert_called_with("Добавить технику", "Наименование:")
        mock_askstring.assert_called_with("Добавить технику", "Тип техники:")
        mock_askstring.assert_called_with("Добавить технику", "Производитель:")
        mock_askstring.assert_called_with("Добавить технику", "Дата покупки:")
        mock_askstring.assert_called_with("Добавить технику", "Срок окончания гарантии:")
        mock_askstring.assert_called_with("Добавить технику", "Статус:")
        self.assertEqual(mock_askstring.call_count, 6)

if __name__ == '__main__':
    unittest.main()