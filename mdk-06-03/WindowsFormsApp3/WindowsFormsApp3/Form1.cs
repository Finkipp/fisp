using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp3
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string Result = "";

            int x = 3;

            while (x > 0)
            {
                if (x > 2) { 
                    Result = Result + "a";
                    x = x - 1;
                    Result = Result + "-";
                }
                if (x == 2) { 
                    Result = Result + "b c";
                    x = x - 1;
                    Result = Result + "-";
                }
                if (x == 1)
                {
                    Result = Result + "d";
                    x = x - 1;     
                }
            }
            MessageBox.Show(Result);
            
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            string Result = "";

            int x = 3;

            while (x > 0)
            {
                if (x > 2)
                {
                    Result = Result + "a";
                    x = x - 1;
                    Result = Result + "-";
                }
                if (x == 2)
                {
                    Result = Result + "b c";
                    x = x - 1;
                    Result = Result + "-";
                }
                if (x == 1)
                {
                    Result = Result + "d";
                    x = x - 1;
                }
            }
            MessageBox.Show(Result);
        }
    }
}
