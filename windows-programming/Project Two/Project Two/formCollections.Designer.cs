namespace Project_Two
{
    partial class formCollections
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(formCollections));
            this.btnShowNames = new System.Windows.Forms.Button();
            this.txtCollections = new System.Windows.Forms.TextBox();
            this.btnHomer = new System.Windows.Forms.Button();
            this.btnLisa = new System.Windows.Forms.Button();
            this.btnBart = new System.Windows.Forms.Button();
            this.btnMarge = new System.Windows.Forms.Button();
            this.btnMaggie = new System.Windows.Forms.Button();
            this.btnExit = new System.Windows.Forms.Button();
            this.picSimpsons = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.picSimpsons)).BeginInit();
            this.SuspendLayout();
            // 
            // btnShowNames
            // 
            this.btnShowNames.Location = new System.Drawing.Point(288, 41);
            this.btnShowNames.Margin = new System.Windows.Forms.Padding(2);
            this.btnShowNames.Name = "btnShowNames";
            this.btnShowNames.Size = new System.Drawing.Size(152, 29);
            this.btnShowNames.TabIndex = 0;
            this.btnShowNames.Text = "Show Controls";
            this.btnShowNames.UseVisualStyleBackColor = true;
            this.btnShowNames.Click += new System.EventHandler(this.btnShowNames_Click);
            // 
            // txtCollections
            // 
            this.txtCollections.Location = new System.Drawing.Point(288, 11);
            this.txtCollections.Margin = new System.Windows.Forms.Padding(2);
            this.txtCollections.Name = "txtCollections";
            this.txtCollections.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtCollections.Size = new System.Drawing.Size(152, 26);
            this.txtCollections.TabIndex = 1;
            this.txtCollections.Text = "The Simpsons";
            this.txtCollections.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // btnHomer
            // 
            this.btnHomer.Location = new System.Drawing.Point(31, 115);
            this.btnHomer.Margin = new System.Windows.Forms.Padding(2);
            this.btnHomer.Name = "btnHomer";
            this.btnHomer.Size = new System.Drawing.Size(69, 27);
            this.btnHomer.TabIndex = 2;
            this.btnHomer.Text = "Homer";
            this.btnHomer.UseVisualStyleBackColor = true;
            // 
            // btnLisa
            // 
            this.btnLisa.Location = new System.Drawing.Point(31, 211);
            this.btnLisa.Margin = new System.Windows.Forms.Padding(2);
            this.btnLisa.Name = "btnLisa";
            this.btnLisa.Size = new System.Drawing.Size(69, 27);
            this.btnLisa.TabIndex = 3;
            this.btnLisa.Text = "Lisa";
            this.btnLisa.UseVisualStyleBackColor = true;
            // 
            // btnBart
            // 
            this.btnBart.Location = new System.Drawing.Point(31, 179);
            this.btnBart.Margin = new System.Windows.Forms.Padding(2);
            this.btnBart.Name = "btnBart";
            this.btnBart.Size = new System.Drawing.Size(69, 27);
            this.btnBart.TabIndex = 4;
            this.btnBart.Text = "Bart";
            this.btnBart.UseVisualStyleBackColor = true;
            // 
            // btnMarge
            // 
            this.btnMarge.Location = new System.Drawing.Point(31, 147);
            this.btnMarge.Margin = new System.Windows.Forms.Padding(2);
            this.btnMarge.Name = "btnMarge";
            this.btnMarge.Size = new System.Drawing.Size(69, 27);
            this.btnMarge.TabIndex = 5;
            this.btnMarge.Text = "Marge";
            this.btnMarge.UseVisualStyleBackColor = true;
            // 
            // btnMaggie
            // 
            this.btnMaggie.Location = new System.Drawing.Point(31, 83);
            this.btnMaggie.Margin = new System.Windows.Forms.Padding(2);
            this.btnMaggie.Name = "btnMaggie";
            this.btnMaggie.Size = new System.Drawing.Size(69, 27);
            this.btnMaggie.TabIndex = 6;
            this.btnMaggie.Text = "Maggie";
            this.btnMaggie.UseVisualStyleBackColor = true;
            // 
            // btnExit
            // 
            this.btnExit.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnExit.Location = new System.Drawing.Point(365, 253);
            this.btnExit.Margin = new System.Windows.Forms.Padding(2);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(75, 34);
            this.btnExit.TabIndex = 7;
            this.btnExit.Text = "Quit";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // picSimpsons
            // 
            this.picSimpsons.Image = ((System.Drawing.Image)(resources.GetObject("picSimpsons.Image")));
            this.picSimpsons.Location = new System.Drawing.Point(1, 12);
            this.picSimpsons.Name = "picSimpsons";
            this.picSimpsons.Size = new System.Drawing.Size(140, 40);
            this.picSimpsons.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picSimpsons.TabIndex = 8;
            this.picSimpsons.TabStop = false;
            // 
            // formCollections
            // 
            this.AcceptButton = this.btnExit;
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.CancelButton = this.btnExit;
            this.ClientSize = new System.Drawing.Size(451, 318);
            this.Controls.Add(this.picSimpsons);
            this.Controls.Add(this.btnExit);
            this.Controls.Add(this.btnMaggie);
            this.Controls.Add(this.btnMarge);
            this.Controls.Add(this.btnBart);
            this.Controls.Add(this.btnLisa);
            this.Controls.Add(this.btnHomer);
            this.Controls.Add(this.txtCollections);
            this.Controls.Add(this.btnShowNames);
            this.DoubleBuffered = true;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(2);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "formCollections";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Collections - Project Two";
            this.Load += new System.EventHandler(this.frmCollections_Load);
            ((System.ComponentModel.ISupportInitialize)(this.picSimpsons)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnShowNames;
        private System.Windows.Forms.TextBox txtCollections;
        private System.Windows.Forms.Button btnHomer;
        private System.Windows.Forms.Button btnLisa;
        private System.Windows.Forms.Button btnBart;
        private System.Windows.Forms.Button btnMarge;
        private System.Windows.Forms.Button btnMaggie;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.PictureBox picSimpsons;
    }
}

