namespace Project_One
{
    partial class formProjectOne
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(formProjectOne));
            this.picShowPicture = new System.Windows.Forms.PictureBox();
            this.btnSelectPicture = new System.Windows.Forms.Button();
            this.btnQuit = new System.Windows.Forms.Button();
            this.ofdSelectPicture = new System.Windows.Forms.OpenFileDialog();
            this.btnDrawBorder = new System.Windows.Forms.Button();
            this.btnEnlarge = new System.Windows.Forms.Button();
            this.btnShrink = new System.Windows.Forms.Button();
            this.lblX = new System.Windows.Forms.Label();
            this.lblY = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.picShowPicture)).BeginInit();
            this.SuspendLayout();
            // 
            // picShowPicture
            // 
            this.picShowPicture.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.picShowPicture.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.picShowPicture.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.picShowPicture.Location = new System.Drawing.Point(8, 41);
            this.picShowPicture.Margin = new System.Windows.Forms.Padding(2);
            this.picShowPicture.Name = "picShowPicture";
            this.picShowPicture.Size = new System.Drawing.Size(553, 364);
            this.picShowPicture.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picShowPicture.TabIndex = 0;
            this.picShowPicture.TabStop = false;
            this.picShowPicture.MouseLeave += new System.EventHandler(this.picShowPicture_MouseLeave);
            this.picShowPicture.MouseMove += new System.Windows.Forms.MouseEventHandler(this.picShowPicture_MouseMove);
            // 
            // btnSelectPicture
            // 
            this.btnSelectPicture.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnSelectPicture.Location = new System.Drawing.Point(16, 8);
            this.btnSelectPicture.Margin = new System.Windows.Forms.Padding(2);
            this.btnSelectPicture.Name = "btnSelectPicture";
            this.btnSelectPicture.Size = new System.Drawing.Size(95, 29);
            this.btnSelectPicture.TabIndex = 1;
            this.btnSelectPicture.Text = "Select Picture";
            this.btnSelectPicture.UseCompatibleTextRendering = true;
            this.btnSelectPicture.UseVisualStyleBackColor = true;
            this.btnSelectPicture.Click += new System.EventHandler(this.btnSelectPicture_Click);
            // 
            // btnQuit
            // 
            this.btnQuit.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnQuit.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnQuit.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnQuit.Location = new System.Drawing.Point(483, 8);
            this.btnQuit.Margin = new System.Windows.Forms.Padding(2);
            this.btnQuit.Name = "btnQuit";
            this.btnQuit.Size = new System.Drawing.Size(77, 29);
            this.btnQuit.TabIndex = 2;
            this.btnQuit.Text = "Quit";
            this.btnQuit.UseVisualStyleBackColor = true;
            this.btnQuit.Click += new System.EventHandler(this.btnQuit_Click);
            // 
            // ofdSelectPicture
            // 
            this.ofdSelectPicture.Filter = "Windows Bitmaps|*.BMP|JPEG|*.JPG|PNG|*.PNG";
            // 
            // btnDrawBorder
            // 
            this.btnDrawBorder.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnDrawBorder.Location = new System.Drawing.Point(115, 8);
            this.btnDrawBorder.Margin = new System.Windows.Forms.Padding(2);
            this.btnDrawBorder.Name = "btnDrawBorder";
            this.btnDrawBorder.Size = new System.Drawing.Size(77, 29);
            this.btnDrawBorder.TabIndex = 3;
            this.btnDrawBorder.Text = "Draw Border";
            this.btnDrawBorder.UseVisualStyleBackColor = true;
            this.btnDrawBorder.Click += new System.EventHandler(this.btnDrawBorder_Click);
            // 
            // btnEnlarge
            // 
            this.btnEnlarge.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnEnlarge.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnEnlarge.Location = new System.Drawing.Point(251, 8);
            this.btnEnlarge.Margin = new System.Windows.Forms.Padding(2);
            this.btnEnlarge.Name = "btnEnlarge";
            this.btnEnlarge.Size = new System.Drawing.Size(33, 29);
            this.btnEnlarge.TabIndex = 4;
            this.btnEnlarge.Text = "+";
            this.btnEnlarge.UseVisualStyleBackColor = true;
            this.btnEnlarge.Click += new System.EventHandler(this.btnEnlarge_Click);
            // 
            // btnShrink
            // 
            this.btnShrink.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnShrink.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnShrink.Location = new System.Drawing.Point(215, 8);
            this.btnShrink.Margin = new System.Windows.Forms.Padding(2);
            this.btnShrink.Name = "btnShrink";
            this.btnShrink.Size = new System.Drawing.Size(33, 29);
            this.btnShrink.TabIndex = 5;
            this.btnShrink.Text = "-";
            this.btnShrink.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btnShrink.UseVisualStyleBackColor = true;
            this.btnShrink.Click += new System.EventHandler(this.btnShrink_Click);
            // 
            // lblX
            // 
            this.lblX.AutoSize = true;
            this.lblX.Font = new System.Drawing.Font("Consolas", 8.25F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblX.Location = new System.Drawing.Point(309, 17);
            this.lblX.Name = "lblX";
            this.lblX.Size = new System.Drawing.Size(0, 13);
            this.lblX.TabIndex = 6;
            // 
            // lblY
            // 
            this.lblY.AutoSize = true;
            this.lblY.Font = new System.Drawing.Font("Consolas", 8.25F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblY.Location = new System.Drawing.Point(381, 18);
            this.lblY.Name = "lblY";
            this.lblY.Size = new System.Drawing.Size(0, 13);
            this.lblY.TabIndex = 7;
            // 
            // formProjectOne
            // 
            this.AcceptButton = this.btnSelectPicture;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.btnQuit;
            this.ClientSize = new System.Drawing.Size(568, 412);
            this.Controls.Add(this.lblY);
            this.Controls.Add(this.lblX);
            this.Controls.Add(this.btnShrink);
            this.Controls.Add(this.btnEnlarge);
            this.Controls.Add(this.btnDrawBorder);
            this.Controls.Add(this.btnQuit);
            this.Controls.Add(this.btnSelectPicture);
            this.Controls.Add(this.picShowPicture);
            this.HelpButton = true;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "formProjectOne";
            this.Text = "Project One";
            this.Resize += new System.EventHandler(this.formProjectOne_Resize);
            ((System.ComponentModel.ISupportInitialize)(this.picShowPicture)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox picShowPicture;
        private System.Windows.Forms.Button btnSelectPicture;
        private System.Windows.Forms.Button btnQuit;
        private System.Windows.Forms.OpenFileDialog ofdSelectPicture;
        private System.Windows.Forms.Button btnDrawBorder;
        private System.Windows.Forms.Button btnEnlarge;
        private System.Windows.Forms.Button btnShrink;
        private System.Windows.Forms.Label lblX;
        private System.Windows.Forms.Label lblY;
    }
}

