namespace WindowsFormsApp6
{
    partial class Form1
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.joeGivesToBob = new System.Windows.Forms.Button();
            this.bobGivesToJoe = new System.Windows.Forms.Button();
            this.joesCashLabel1 = new System.Windows.Forms.Label();
            this.bobsCashLabel1 = new System.Windows.Forms.Label();
            this.bankCashLabel1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(11, 101);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 42);
            this.button1.TabIndex = 0;
            this.button1.Text = "Give $10 to Joe";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(92, 101);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 42);
            this.button2.TabIndex = 1;
            this.button2.Text = "Receive $5 from Bob";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // joeGivesToBob
            // 
            this.joeGivesToBob.Location = new System.Drawing.Point(11, 149);
            this.joeGivesToBob.Name = "joeGivesToBob";
            this.joeGivesToBob.Size = new System.Drawing.Size(75, 39);
            this.joeGivesToBob.TabIndex = 2;
            this.joeGivesToBob.Text = "Joe $10 to Joe";
            this.joeGivesToBob.UseVisualStyleBackColor = true;
            this.joeGivesToBob.Click += new System.EventHandler(this.joeGivesToBob_Click);
            // 
            // bobGivesToJoe
            // 
            this.bobGivesToJoe.Location = new System.Drawing.Point(92, 149);
            this.bobGivesToJoe.Name = "bobGivesToJoe";
            this.bobGivesToJoe.Size = new System.Drawing.Size(75, 39);
            this.bobGivesToJoe.TabIndex = 3;
            this.bobGivesToJoe.Text = "Bob gives $5 to Joe";
            this.bobGivesToJoe.UseVisualStyleBackColor = true;
            this.bobGivesToJoe.Click += new System.EventHandler(this.bobGivesToJoe_Click);
            // 
            // joesCashLabel1
            // 
            this.joesCashLabel1.AutoSize = true;
            this.joesCashLabel1.Location = new System.Drawing.Point(12, 9);
            this.joesCashLabel1.Name = "joesCashLabel1";
            this.joesCashLabel1.Size = new System.Drawing.Size(35, 13);
            this.joesCashLabel1.TabIndex = 4;
            this.joesCashLabel1.Text = "label1";
            // 
            // bobsCashLabel1
            // 
            this.bobsCashLabel1.AutoSize = true;
            this.bobsCashLabel1.Location = new System.Drawing.Point(12, 32);
            this.bobsCashLabel1.Name = "bobsCashLabel1";
            this.bobsCashLabel1.Size = new System.Drawing.Size(35, 13);
            this.bobsCashLabel1.TabIndex = 5;
            this.bobsCashLabel1.Text = "label1";
            // 
            // bankCashLabel1
            // 
            this.bankCashLabel1.AutoSize = true;
            this.bankCashLabel1.Location = new System.Drawing.Point(12, 54);
            this.bankCashLabel1.Name = "bankCashLabel1";
            this.bankCashLabel1.Size = new System.Drawing.Size(35, 13);
            this.bankCashLabel1.TabIndex = 6;
            this.bankCashLabel1.Text = "label1";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.bankCashLabel1);
            this.Controls.Add(this.bobsCashLabel1);
            this.Controls.Add(this.joesCashLabel1);
            this.Controls.Add(this.bobGivesToJoe);
            this.Controls.Add(this.joeGivesToBob);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button joeGivesToBob;
        private System.Windows.Forms.Button bobGivesToJoe;
        private System.Windows.Forms.Label joesCashLabel1;
        private System.Windows.Forms.Label bobsCashLabel1;
        private System.Windows.Forms.Label bankCashLabel1;
    }
}

