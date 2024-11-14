using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp6
{
    public partial class Form1 : Form
    {
        Guy joe;
        Guy bob;
        int bank = 100;

        public Form1()
        {
            InitializeComponent();
            bob = new Guy() { Cash = 100, Name = "Bob" };
            joe = new Guy() { Cash = 50, Name = "Joe" };
            UpdateForm();
        }

        public class Guy
        {
            public string Name { get; set; }
            public int Cash { get; set; }

            public int GiveCash(int amount)
            {
                if (amount > Cash)
                {
                    amount = Cash;
                }
                Cash -= amount;
                return amount;
            }

            public void ReceiveCash(int amount)
            {
                if (amount < 0)
                {
                    throw new ArgumentException("Сумма должна быть положительной", nameof(amount));
                }
                Cash += amount;
            }
        }

        public void UpdateForm()
        {
            joesCashLabel1.Text = joe.Name + " имеет $" + joe.Cash;
            bobsCashLabel1.Text = bob.Name + " имеет $" + bob.Cash;
            bankCashLabel1.Text = "В банке $" + bank;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (bank >= 10)
            {
                joe.ReceiveCash(10); // Просто принимаем деньги
                bank -= 10; // Уменьшаем банк на 10
                UpdateForm();
            }
            else
            {
                MessageBox.Show("В банке нет денег.");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            bank += bob.GiveCash(5);
            UpdateForm();
        }

        private void joeGivesToBob_Click(object sender, EventArgs e)
        {
            bob.ReceiveCash(joe.GiveCash(10));
            UpdateForm();
        }

        private void bobGivesToJoe_Click(object sender, EventArgs e)
        {
            joe.ReceiveCash(bob.GiveCash(5));
            UpdateForm();
        }
    }
}