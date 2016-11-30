namespace RPNCalculator
{
    partial class frmRPNCalculator
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.txtFirstNum = new System.Windows.Forms.TextBox();
            this.bindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.txtSecondNum = new System.Windows.Forms.TextBox();
            this.txtAnswer = new System.Windows.Forms.TextBox();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnSubt = new System.Windows.Forms.Button();
            this.btnMult = new System.Windows.Forms.Button();
            this.btnDiv = new System.Windows.Forms.Button();
            this.btnClear = new System.Windows.Forms.Button();
            this.btnExit = new System.Windows.Forms.Button();
            this.lblFirstNumber = new System.Windows.Forms.Label();
            this.lblSecondNumber = new System.Windows.Forms.Label();
            this.lblResult = new System.Windows.Forms.Label();
            this.btnModulo = new System.Windows.Forms.Button();
            this.btnPow = new System.Windows.Forms.Button();
            this.btnMax = new System.Windows.Forms.Button();
            this.btnMin = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).BeginInit();
            this.SuspendLayout();
            // 
            // txtFirstNum
            // 
            this.txtFirstNum.Anchor = System.Windows.Forms.AnchorStyles.Right;
            this.txtFirstNum.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txtFirstNum.Location = new System.Drawing.Point(383, 93);
            this.txtFirstNum.Name = "txtFirstNum";
            this.txtFirstNum.Size = new System.Drawing.Size(100, 35);
            this.txtFirstNum.TabIndex = 0;
            // 
            // txtSecondNum
            // 
            this.txtSecondNum.Anchor = System.Windows.Forms.AnchorStyles.Right;
            this.txtSecondNum.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txtSecondNum.Location = new System.Drawing.Point(383, 151);
            this.txtSecondNum.Name = "txtSecondNum";
            this.txtSecondNum.Size = new System.Drawing.Size(100, 35);
            this.txtSecondNum.TabIndex = 1;
            // 
            // txtAnswer
            // 
            this.txtAnswer.Anchor = System.Windows.Forms.AnchorStyles.Right;
            this.txtAnswer.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txtAnswer.Location = new System.Drawing.Point(383, 211);
            this.txtAnswer.Name = "txtAnswer";
            this.txtAnswer.Size = new System.Drawing.Size(100, 35);
            this.txtAnswer.TabIndex = 2;
            // 
            // btnAdd
            // 
            this.btnAdd.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.btnAdd.BackColor = System.Drawing.SystemColors.ControlLight;
            this.btnAdd.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.btnAdd.FlatAppearance.BorderSize = 0;
            this.btnAdd.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnAdd.Location = new System.Drawing.Point(13, 95);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(91, 76);
            this.btnAdd.TabIndex = 3;
            this.btnAdd.Text = "+";
            this.btnAdd.UseVisualStyleBackColor = false;
            // 
            // btnSubt
            // 
            this.btnSubt.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.btnSubt.BackColor = System.Drawing.SystemColors.ControlLight;
            this.btnSubt.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.btnSubt.FlatAppearance.BorderSize = 0;
            this.btnSubt.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnSubt.Location = new System.Drawing.Point(13, 13);
            this.btnSubt.Name = "btnSubt";
            this.btnSubt.Size = new System.Drawing.Size(91, 76);
            this.btnSubt.TabIndex = 4;
            this.btnSubt.Text = "-";
            this.btnSubt.UseVisualStyleBackColor = false;
            // 
            // btnMult
            // 
            this.btnMult.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.btnMult.BackColor = System.Drawing.SystemColors.ControlLight;
            this.btnMult.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.btnMult.FlatAppearance.BorderSize = 0;
            this.btnMult.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnMult.Location = new System.Drawing.Point(110, 13);
            this.btnMult.Name = "btnMult";
            this.btnMult.Size = new System.Drawing.Size(92, 76);
            this.btnMult.TabIndex = 5;
            this.btnMult.Text = "x";
            this.btnMult.UseVisualStyleBackColor = false;
            // 
            // btnDiv
            // 
            this.btnDiv.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.btnDiv.BackColor = System.Drawing.SystemColors.ControlLight;
            this.btnDiv.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.btnDiv.FlatAppearance.BorderSize = 0;
            this.btnDiv.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnDiv.Location = new System.Drawing.Point(110, 95);
            this.btnDiv.Name = "btnDiv";
            this.btnDiv.Size = new System.Drawing.Size(92, 76);
            this.btnDiv.TabIndex = 6;
            this.btnDiv.Text = "/";
            this.btnDiv.UseVisualStyleBackColor = false;
            // 
            // btnClear
            // 
            this.btnClear.Anchor = System.Windows.Forms.AnchorStyles.Right;
            this.btnClear.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.btnClear.FlatAppearance.BorderSize = 0;
            this.btnClear.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnClear.Location = new System.Drawing.Point(348, 13);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(152, 56);
            this.btnClear.TabIndex = 7;
            this.btnClear.Text = "Clear";
            this.btnClear.UseVisualStyleBackColor = true;
            this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
            // 
            // btnExit
            // 
            this.btnExit.Anchor = System.Windows.Forms.AnchorStyles.Right;
            this.btnExit.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.btnExit.FlatAppearance.BorderSize = 0;
            this.btnExit.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnExit.Location = new System.Drawing.Point(348, 279);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(152, 56);
            this.btnExit.TabIndex = 8;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // lblFirstNumber
            // 
            this.lblFirstNumber.Anchor = System.Windows.Forms.AnchorStyles.Right;
            this.lblFirstNumber.AutoSize = true;
            this.lblFirstNumber.Location = new System.Drawing.Point(257, 103);
            this.lblFirstNumber.Name = "lblFirstNumber";
            this.lblFirstNumber.Size = new System.Drawing.Size(100, 20);
            this.lblFirstNumber.TabIndex = 9;
            this.lblFirstNumber.Text = "First Number";
            this.lblFirstNumber.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lblSecondNumber
            // 
            this.lblSecondNumber.Anchor = System.Windows.Forms.AnchorStyles.Right;
            this.lblSecondNumber.AutoSize = true;
            this.lblSecondNumber.Location = new System.Drawing.Point(244, 161);
            this.lblSecondNumber.Name = "lblSecondNumber";
            this.lblSecondNumber.Size = new System.Drawing.Size(124, 20);
            this.lblSecondNumber.TabIndex = 10;
            this.lblSecondNumber.Text = "Second Number";
            this.lblSecondNumber.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lblResult
            // 
            this.lblResult.Anchor = System.Windows.Forms.AnchorStyles.Right;
            this.lblResult.AutoSize = true;
            this.lblResult.Location = new System.Drawing.Point(273, 221);
            this.lblResult.Name = "lblResult";
            this.lblResult.Size = new System.Drawing.Size(55, 20);
            this.lblResult.TabIndex = 11;
            this.lblResult.Text = "Result";
            this.lblResult.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // btnModulo
            // 
            this.btnModulo.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.btnModulo.BackColor = System.Drawing.SystemColors.ControlLight;
            this.btnModulo.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.btnModulo.FlatAppearance.BorderSize = 0;
            this.btnModulo.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnModulo.Location = new System.Drawing.Point(110, 177);
            this.btnModulo.Name = "btnModulo";
            this.btnModulo.Size = new System.Drawing.Size(92, 76);
            this.btnModulo.TabIndex = 12;
            this.btnModulo.Text = "%";
            this.btnModulo.UseVisualStyleBackColor = false;
            // 
            // btnPow
            // 
            this.btnPow.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.btnPow.BackColor = System.Drawing.SystemColors.ControlLight;
            this.btnPow.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.btnPow.FlatAppearance.BorderSize = 0;
            this.btnPow.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btnPow.Location = new System.Drawing.Point(13, 177);
            this.btnPow.Name = "btnPow";
            this.btnPow.Size = new System.Drawing.Size(91, 76);
            this.btnPow.TabIndex = 13;
            this.btnPow.Text = "POW";
            this.btnPow.UseVisualStyleBackColor = false;
            // 
            // btnMax
            // 
            this.btnMax.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.btnMax.BackColor = System.Drawing.SystemColors.ControlLight;
            this.btnMax.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.btnMax.FlatAppearance.BorderSize = 0;
            this.btnMax.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btnMax.Location = new System.Drawing.Point(110, 259);
            this.btnMax.Name = "btnMax";
            this.btnMax.Size = new System.Drawing.Size(92, 76);
            this.btnMax.TabIndex = 14;
            this.btnMax.Text = "MAX";
            this.btnMax.UseVisualStyleBackColor = false;
            // 
            // btnMin
            // 
            this.btnMin.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.btnMin.BackColor = System.Drawing.SystemColors.ControlLight;
            this.btnMin.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.btnMin.FlatAppearance.BorderSize = 0;
            this.btnMin.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btnMin.Location = new System.Drawing.Point(13, 259);
            this.btnMin.Name = "btnMin";
            this.btnMin.Size = new System.Drawing.Size(91, 76);
            this.btnMin.TabIndex = 15;
            this.btnMin.Text = "MIN";
            this.btnMin.UseVisualStyleBackColor = false;
            // 
            // frmRPNCalculator
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(512, 360);
            this.Controls.Add(this.btnMult);
            this.Controls.Add(this.btnMin);
            this.Controls.Add(this.btnSubt);
            this.Controls.Add(this.lblResult);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.lblSecondNumber);
            this.Controls.Add(this.btnPow);
            this.Controls.Add(this.lblFirstNumber);
            this.Controls.Add(this.btnDiv);
            this.Controls.Add(this.btnExit);
            this.Controls.Add(this.btnModulo);
            this.Controls.Add(this.btnClear);
            this.Controls.Add(this.btnMax);
            this.Controls.Add(this.txtAnswer);
            this.Controls.Add(this.txtSecondNum);
            this.Controls.Add(this.txtFirstNum);
            this.Name = "frmRPNCalculator";
            this.Text = " RPN Calculator";
            this.Load += new System.EventHandler(this.frmRPNCalculator_Load);
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtFirstNum;
        private System.Windows.Forms.BindingSource bindingSource1;
        private System.Windows.Forms.TextBox txtSecondNum;
        private System.Windows.Forms.TextBox txtAnswer;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnSubt;
        private System.Windows.Forms.Button btnMult;
        private System.Windows.Forms.Button btnDiv;
        private System.Windows.Forms.Button btnClear;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Label lblFirstNumber;
        private System.Windows.Forms.Label lblSecondNumber;
        private System.Windows.Forms.Label lblResult;
        private System.Windows.Forms.Button btnModulo;
        private System.Windows.Forms.Button btnPow;
        private System.Windows.Forms.Button btnMax;
        private System.Windows.Forms.Button btnMin;
    }
}

