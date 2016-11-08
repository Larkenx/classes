namespace Collections
{
    partial class frmCollections
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
            this.btnShowNames = new System.Windows.Forms.Button();
            this.txtBox = new System.Windows.Forms.TextBox();
            this.btnHomer = new System.Windows.Forms.Button();
            this.btnLisa = new System.Windows.Forms.Button();
            this.btnBart = new System.Windows.Forms.Button();
            this.btnMarge = new System.Windows.Forms.Button();
            this.btnMaggie = new System.Windows.Forms.Button();
            this.btnOptions = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnShowNames
            // 
            this.btnShowNames.Location = new System.Drawing.Point(186, 34);
            this.btnShowNames.Name = "btnShowNames";
            this.btnShowNames.Size = new System.Drawing.Size(196, 41);
            this.btnShowNames.TabIndex = 0;
            this.btnShowNames.Text = "Show Control Names";
            this.btnShowNames.UseVisualStyleBackColor = true;
            this.btnShowNames.Click += new System.EventHandler(this.btnShowNames_Click);
            // 
            // txtBox
            // 
            this.txtBox.Location = new System.Drawing.Point(186, 97);
            this.txtBox.Name = "txtBox";
            this.txtBox.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtBox.Size = new System.Drawing.Size(196, 26);
            this.txtBox.TabIndex = 1;
            this.txtBox.Text = "The Simpsons";
            // 
            // btnHomer
            // 
            this.btnHomer.Location = new System.Drawing.Point(62, 244);
            this.btnHomer.Name = "btnHomer";
            this.btnHomer.Size = new System.Drawing.Size(103, 36);
            this.btnHomer.TabIndex = 2;
            this.btnHomer.Text = "Homer";
            this.btnHomer.UseVisualStyleBackColor = true;
            // 
            // btnLisa
            // 
            this.btnLisa.Location = new System.Drawing.Point(406, 313);
            this.btnLisa.Name = "btnLisa";
            this.btnLisa.Size = new System.Drawing.Size(103, 36);
            this.btnLisa.TabIndex = 3;
            this.btnLisa.Text = "Lisa";
            this.btnLisa.UseVisualStyleBackColor = true;
            // 
            // btnBart
            // 
            this.btnBart.Location = new System.Drawing.Point(406, 244);
            this.btnBart.Name = "btnBart";
            this.btnBart.Size = new System.Drawing.Size(103, 36);
            this.btnBart.TabIndex = 4;
            this.btnBart.Text = "Bart";
            this.btnBart.UseVisualStyleBackColor = true;
            // 
            // btnMarge
            // 
            this.btnMarge.Location = new System.Drawing.Point(62, 313);
            this.btnMarge.Name = "btnMarge";
            this.btnMarge.Size = new System.Drawing.Size(103, 36);
            this.btnMarge.TabIndex = 5;
            this.btnMarge.Text = "Marge";
            this.btnMarge.UseVisualStyleBackColor = true;
            // 
            // btnMaggie
            // 
            this.btnMaggie.Location = new System.Drawing.Point(230, 313);
            this.btnMaggie.Name = "btnMaggie";
            this.btnMaggie.Size = new System.Drawing.Size(103, 36);
            this.btnMaggie.TabIndex = 6;
            this.btnMaggie.Text = "Maggie";
            this.btnMaggie.UseVisualStyleBackColor = true;
            // 
            // btnOptions
            // 
            this.btnOptions.Location = new System.Drawing.Point(13, 34);
            this.btnOptions.Name = "btnOptions";
            this.btnOptions.Size = new System.Drawing.Size(133, 41);
            this.btnOptions.TabIndex = 7;
            this.btnOptions.Text = "Options";
            this.btnOptions.UseVisualStyleBackColor = true;
            this.btnOptions.Click += new System.EventHandler(this.btnOptions_Click);
            // 
            // frmCollections
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(539, 407);
            this.Controls.Add(this.btnOptions);
            this.Controls.Add(this.btnMaggie);
            this.Controls.Add(this.btnMarge);
            this.Controls.Add(this.btnBart);
            this.Controls.Add(this.btnLisa);
            this.Controls.Add(this.btnHomer);
            this.Controls.Add(this.txtBox);
            this.Controls.Add(this.btnShowNames);
            this.Name = "frmCollections";
            this.Text = "A290 Collections";
            this.Load += new System.EventHandler(this.frmCollections_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnShowNames;
        private System.Windows.Forms.TextBox txtBox;
        private System.Windows.Forms.Button btnHomer;
        private System.Windows.Forms.Button btnLisa;
        private System.Windows.Forms.Button btnBart;
        private System.Windows.Forms.Button btnMarge;
        private System.Windows.Forms.Button btnMaggie;
        private System.Windows.Forms.Button btnOptions;
    }
}

