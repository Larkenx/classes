namespace PageRankProject
{
    partial class PageRank
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
            this.txt_DisplayLinks = new System.Windows.Forms.TextBox();
            this.txt_targetPage = new System.Windows.Forms.TextBox();
            this.btn_Search = new System.Windows.Forms.Button();
            this.cbo_RecursionDepth = new System.Windows.Forms.ComboBox();
            this.picBox_ShowVisualization = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.picBox_ShowVisualization)).BeginInit();
            this.SuspendLayout();
            // 
            // txt_DisplayLinks
            // 
            this.txt_DisplayLinks.Font = new System.Drawing.Font("Consolas", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_DisplayLinks.Location = new System.Drawing.Point(20, 175);
            this.txt_DisplayLinks.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txt_DisplayLinks.Multiline = true;
            this.txt_DisplayLinks.Name = "txt_DisplayLinks";
            this.txt_DisplayLinks.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txt_DisplayLinks.Size = new System.Drawing.Size(754, 492);
            this.txt_DisplayLinks.TabIndex = 0;
            // 
            // txt_targetPage
            // 
            this.txt_targetPage.Location = new System.Drawing.Point(173, 14);
            this.txt_targetPage.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txt_targetPage.Name = "txt_targetPage";
            this.txt_targetPage.ScrollBars = System.Windows.Forms.ScrollBars.Horizontal;
            this.txt_targetPage.Size = new System.Drawing.Size(385, 26);
            this.txt_targetPage.TabIndex = 1;
            this.txt_targetPage.Text = "Type in a URL and click search...";
            // 
            // btn_Search
            // 
            this.btn_Search.Location = new System.Drawing.Point(233, 96);
            this.btn_Search.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btn_Search.Name = "btn_Search";
            this.btn_Search.Size = new System.Drawing.Size(246, 38);
            this.btn_Search.TabIndex = 2;
            this.btn_Search.Text = "Search";
            this.btn_Search.UseVisualStyleBackColor = true;
            this.btn_Search.Click += new System.EventHandler(this.btn_Search_Click);
            // 
            // cbo_RecursionDepth
            // 
            this.cbo_RecursionDepth.FormattingEnabled = true;
            this.cbo_RecursionDepth.Items.AddRange(new object[] {
            "0",
            "1",
            "2",
            "3",
            "4",
            "5"});
            this.cbo_RecursionDepth.Location = new System.Drawing.Point(171, 54);
            this.cbo_RecursionDepth.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cbo_RecursionDepth.Name = "cbo_RecursionDepth";
            this.cbo_RecursionDepth.Size = new System.Drawing.Size(386, 28);
            this.cbo_RecursionDepth.TabIndex = 3;
            this.cbo_RecursionDepth.Text = "Select a Recursion Depth...";
            // 
            // picBox_ShowVisualization
            // 
            this.picBox_ShowVisualization.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.picBox_ShowVisualization.Location = new System.Drawing.Point(797, 14);
            this.picBox_ShowVisualization.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.picBox_ShowVisualization.Name = "picBox_ShowVisualization";
            this.picBox_ShowVisualization.Size = new System.Drawing.Size(554, 653);
            this.picBox_ShowVisualization.TabIndex = 4;
            this.picBox_ShowVisualization.TabStop = false;
            // 
            // PageRank
            // 
            this.AcceptButton = this.btn_Search;
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1364, 681);
            this.Controls.Add(this.picBox_ShowVisualization);
            this.Controls.Add(this.cbo_RecursionDepth);
            this.Controls.Add(this.btn_Search);
            this.Controls.Add(this.txt_targetPage);
            this.Controls.Add(this.txt_DisplayLinks);
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "PageRank";
            this.Text = "Page Rank Application";
            ((System.ComponentModel.ISupportInitialize)(this.picBox_ShowVisualization)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txt_DisplayLinks;
        private System.Windows.Forms.TextBox txt_targetPage;
        private System.Windows.Forms.Button btn_Search;
        private System.Windows.Forms.ComboBox cbo_RecursionDepth;
        private System.Windows.Forms.PictureBox picBox_ShowVisualization;
    }
}

