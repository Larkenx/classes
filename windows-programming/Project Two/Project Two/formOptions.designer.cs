namespace Project_Two
{
    partial class formOptions
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
            this.btnOK = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.lblUserName = new System.Windows.Forms.Label();
            this.txtUserNae = new System.Windows.Forms.TextBox();
            this.grpDefaultBackgroundColor = new System.Windows.Forms.GroupBox();
            this.optBackgroundDefault = new System.Windows.Forms.RadioButton();
            this.optBackgroundGreen = new System.Windows.Forms.RadioButton();
            this.optBackgroundBlue = new System.Windows.Forms.RadioButton();
            this.optBackgroundRed = new System.Windows.Forms.RadioButton();
            this.cboBorderColors = new System.Windows.Forms.ComboBox();
            this.grpDefaultBackgroundColor.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnOK
            // 
            this.btnOK.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnOK.Location = new System.Drawing.Point(321, 26);
            this.btnOK.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnOK.Name = "btnOK";
            this.btnOK.Size = new System.Drawing.Size(52, 31);
            this.btnOK.TabIndex = 0;
            this.btnOK.Text = "OK";
            this.btnOK.UseVisualStyleBackColor = true;
            this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnCancel.Location = new System.Drawing.Point(321, 71);
            this.btnCancel.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(52, 31);
            this.btnCancel.TabIndex = 1;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // lblUserName
            // 
            this.lblUserName.AutoSize = true;
            this.lblUserName.Location = new System.Drawing.Point(11, 26);
            this.lblUserName.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.lblUserName.Name = "lblUserName";
            this.lblUserName.Size = new System.Drawing.Size(136, 13);
            this.lblUserName.TabIndex = 2;
            this.lblUserName.Text = "This is some awesome text.";
            this.lblUserName.Click += new System.EventHandler(this.label1_Click);
            // 
            // txtUserNae
            // 
            this.txtUserNae.Location = new System.Drawing.Point(14, 47);
            this.txtUserNae.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.txtUserNae.Multiline = true;
            this.txtUserNae.Name = "txtUserNae";
            this.txtUserNae.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtUserNae.Size = new System.Drawing.Size(133, 78);
            this.txtUserNae.TabIndex = 3;
            this.txtUserNae.Text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit";
            // 
            // grpDefaultBackgroundColor
            // 
            this.grpDefaultBackgroundColor.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.grpDefaultBackgroundColor.Controls.Add(this.optBackgroundDefault);
            this.grpDefaultBackgroundColor.Controls.Add(this.optBackgroundGreen);
            this.grpDefaultBackgroundColor.Controls.Add(this.optBackgroundBlue);
            this.grpDefaultBackgroundColor.Controls.Add(this.optBackgroundRed);
            this.grpDefaultBackgroundColor.Location = new System.Drawing.Point(14, 210);
            this.grpDefaultBackgroundColor.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.grpDefaultBackgroundColor.Name = "grpDefaultBackgroundColor";
            this.grpDefaultBackgroundColor.Padding = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.grpDefaultBackgroundColor.Size = new System.Drawing.Size(183, 86);
            this.grpDefaultBackgroundColor.TabIndex = 4;
            this.grpDefaultBackgroundColor.TabStop = false;
            this.grpDefaultBackgroundColor.Text = "Options Default Background Color";
            // 
            // optBackgroundDefault
            // 
            this.optBackgroundDefault.AutoSize = true;
            this.optBackgroundDefault.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.optBackgroundDefault.ForeColor = System.Drawing.Color.Black;
            this.optBackgroundDefault.Location = new System.Drawing.Point(101, 43);
            this.optBackgroundDefault.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.optBackgroundDefault.Name = "optBackgroundDefault";
            this.optBackgroundDefault.Size = new System.Drawing.Size(66, 17);
            this.optBackgroundDefault.TabIndex = 8;
            this.optBackgroundDefault.TabStop = true;
            this.optBackgroundDefault.Text = "Default";
            this.optBackgroundDefault.UseVisualStyleBackColor = true;
            this.optBackgroundDefault.CheckedChanged += new System.EventHandler(this.optBackgroundDefault_CheckedChanged);
            // 
            // optBackgroundGreen
            // 
            this.optBackgroundGreen.AutoSize = true;
            this.optBackgroundGreen.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.optBackgroundGreen.ForeColor = System.Drawing.Color.Green;
            this.optBackgroundGreen.Location = new System.Drawing.Point(101, 23);
            this.optBackgroundGreen.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.optBackgroundGreen.Name = "optBackgroundGreen";
            this.optBackgroundGreen.Size = new System.Drawing.Size(59, 17);
            this.optBackgroundGreen.TabIndex = 7;
            this.optBackgroundGreen.TabStop = true;
            this.optBackgroundGreen.Text = "Green";
            this.optBackgroundGreen.UseVisualStyleBackColor = true;
            this.optBackgroundGreen.CheckedChanged += new System.EventHandler(this.optBackgroundGreen_CheckedChanged);
            // 
            // optBackgroundBlue
            // 
            this.optBackgroundBlue.AutoSize = true;
            this.optBackgroundBlue.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.optBackgroundBlue.ForeColor = System.Drawing.Color.Blue;
            this.optBackgroundBlue.Location = new System.Drawing.Point(33, 43);
            this.optBackgroundBlue.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.optBackgroundBlue.Name = "optBackgroundBlue";
            this.optBackgroundBlue.Size = new System.Drawing.Size(50, 17);
            this.optBackgroundBlue.TabIndex = 6;
            this.optBackgroundBlue.TabStop = true;
            this.optBackgroundBlue.Text = "Blue";
            this.optBackgroundBlue.UseVisualStyleBackColor = true;
            this.optBackgroundBlue.CheckedChanged += new System.EventHandler(this.optBackgroundBlue_CheckedChanged);
            // 
            // optBackgroundRed
            // 
            this.optBackgroundRed.AutoSize = true;
            this.optBackgroundRed.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.optBackgroundRed.ForeColor = System.Drawing.Color.Red;
            this.optBackgroundRed.Location = new System.Drawing.Point(33, 23);
            this.optBackgroundRed.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.optBackgroundRed.Name = "optBackgroundRed";
            this.optBackgroundRed.Size = new System.Drawing.Size(48, 17);
            this.optBackgroundRed.TabIndex = 5;
            this.optBackgroundRed.TabStop = true;
            this.optBackgroundRed.Text = "Red";
            this.optBackgroundRed.UseVisualStyleBackColor = true;
            this.optBackgroundRed.CheckedChanged += new System.EventHandler(this.optBackgroundRed_CheckedChanged);
            // 
            // cboBorderColors
            // 
            this.cboBorderColors.AutoCompleteCustomSource.AddRange(new string[] {
            "Default",
            "Cyan",
            "Yellow",
            "Purple"});
            this.cboBorderColors.FormattingEnabled = true;
            this.cboBorderColors.Items.AddRange(new object[] {
            "Default",
            "Cyan",
            "Yellow",
            "Purple"});
            this.cboBorderColors.Location = new System.Drawing.Point(14, 138);
            this.cboBorderColors.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.cboBorderColors.Name = "cboBorderColors";
            this.cboBorderColors.Size = new System.Drawing.Size(147, 21);
            this.cboBorderColors.TabIndex = 0;
            this.cboBorderColors.Text = "Choose Your Border Color";
            this.cboBorderColors.SelectedIndexChanged += new System.EventHandler(this.cboBorderColors_SelectedIndexChanged);
            // 
            // formOptions
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.ClientSize = new System.Drawing.Size(381, 327);
            this.Controls.Add(this.cboBorderColors);
            this.Controls.Add(this.grpDefaultBackgroundColor);
            this.Controls.Add(this.txtUserNae);
            this.Controls.Add(this.lblUserName);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnOK);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "formOptions";
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Show;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Options - Project Two";
            this.grpDefaultBackgroundColor.ResumeLayout(false);
            this.grpDefaultBackgroundColor.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnOK;
        private System.Windows.Forms.Button btnCancel;
        public System.Windows.Forms.Label lblUserName;
        private System.Windows.Forms.TextBox txtUserNae;
        private System.Windows.Forms.GroupBox grpDefaultBackgroundColor;
        private System.Windows.Forms.RadioButton optBackgroundRed;
        private System.Windows.Forms.ComboBox cboBorderColors;
        private System.Windows.Forms.RadioButton optBackgroundBlue;
        private System.Windows.Forms.RadioButton optBackgroundGreen;
        private System.Windows.Forms.RadioButton optBackgroundDefault;
    }
}