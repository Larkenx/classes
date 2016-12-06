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
            this.TabsContainer = new System.Windows.Forms.TabControl();
            this.LogsTab = new System.Windows.Forms.TabPage();
            this.GraphTab = new System.Windows.Forms.TabPage();
            this.TabsContainer.SuspendLayout();
            this.LogsTab.SuspendLayout();
            this.SuspendLayout();
            // 
            // txt_DisplayLinks
            // 
            this.txt_DisplayLinks.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txt_DisplayLinks.Font = new System.Drawing.Font("Consolas", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_DisplayLinks.Location = new System.Drawing.Point(3, 3);
            this.txt_DisplayLinks.Multiline = true;
            this.txt_DisplayLinks.Name = "txt_DisplayLinks";
            this.txt_DisplayLinks.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txt_DisplayLinks.Size = new System.Drawing.Size(1031, 398);
            this.txt_DisplayLinks.TabIndex = 0;
            // 
            // txt_targetPage
            // 
            this.txt_targetPage.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.txt_targetPage.Location = new System.Drawing.Point(423, 12);
            this.txt_targetPage.Name = "txt_targetPage";
            this.txt_targetPage.ScrollBars = System.Windows.Forms.ScrollBars.Horizontal;
            this.txt_targetPage.Size = new System.Drawing.Size(258, 20);
            this.txt_targetPage.TabIndex = 1;
            this.txt_targetPage.Text = "Type in a URL and click search...";
            this.txt_targetPage.Click += new System.EventHandler(this.txt_targetPage_Click);
            // 
            // btn_Search
            // 
            this.btn_Search.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.btn_Search.Location = new System.Drawing.Point(490, 65);
            this.btn_Search.Name = "btn_Search";
            this.btn_Search.Size = new System.Drawing.Size(143, 25);
            this.btn_Search.TabIndex = 2;
            this.btn_Search.Text = "Search";
            this.btn_Search.UseVisualStyleBackColor = true;
            this.btn_Search.Click += new System.EventHandler(this.btn_Search_Click);
            // 
            // cbo_RecursionDepth
            // 
            this.cbo_RecursionDepth.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.cbo_RecursionDepth.FormattingEnabled = true;
            this.cbo_RecursionDepth.Items.AddRange(new object[] {
            "0",
            "1",
            "2",
            "3",
            "4",
            "5"});
            this.cbo_RecursionDepth.Location = new System.Drawing.Point(422, 38);
            this.cbo_RecursionDepth.Name = "cbo_RecursionDepth";
            this.cbo_RecursionDepth.Size = new System.Drawing.Size(259, 21);
            this.cbo_RecursionDepth.TabIndex = 3;
            this.cbo_RecursionDepth.Text = "Select a Recursion Depth...";
            // 
            // TabsContainer
            // 
            this.TabsContainer.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.TabsContainer.Controls.Add(this.LogsTab);
            this.TabsContainer.Controls.Add(this.GraphTab);
            this.TabsContainer.Location = new System.Drawing.Point(12, 93);
            this.TabsContainer.Name = "TabsContainer";
            this.TabsContainer.SelectedIndex = 0;
            this.TabsContainer.Size = new System.Drawing.Size(1045, 430);
            this.TabsContainer.TabIndex = 4;
            // 
            // LogsTab
            // 
            this.LogsTab.Controls.Add(this.txt_DisplayLinks);
            this.LogsTab.Location = new System.Drawing.Point(4, 22);
            this.LogsTab.Name = "LogsTab";
            this.LogsTab.Padding = new System.Windows.Forms.Padding(3);
            this.LogsTab.Size = new System.Drawing.Size(1037, 404);
            this.LogsTab.TabIndex = 0;
            this.LogsTab.Text = "Logs";
            this.LogsTab.UseVisualStyleBackColor = true;
            // 
            // GraphTab
            // 
            this.GraphTab.Location = new System.Drawing.Point(4, 22);
            this.GraphTab.Name = "GraphTab";
            this.GraphTab.Padding = new System.Windows.Forms.Padding(3);
            this.GraphTab.Size = new System.Drawing.Size(1037, 404);
            this.GraphTab.TabIndex = 1;
            this.GraphTab.Text = "Graph View";
            this.GraphTab.UseVisualStyleBackColor = true;
            // 
            // PageRank
            // 
            this.AcceptButton = this.btn_Search;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1069, 535);
            this.Controls.Add(this.TabsContainer);
            this.Controls.Add(this.cbo_RecursionDepth);
            this.Controls.Add(this.btn_Search);
            this.Controls.Add(this.txt_targetPage);
            this.Name = "PageRank";
            this.Text = "Page Rank Application";
            this.TabsContainer.ResumeLayout(false);
            this.LogsTab.ResumeLayout(false);
            this.LogsTab.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txt_DisplayLinks;
        private System.Windows.Forms.TextBox txt_targetPage;
        private System.Windows.Forms.Button btn_Search;
        private System.Windows.Forms.ComboBox cbo_RecursionDepth;
        private System.Windows.Forms.TabControl TabsContainer;
        private System.Windows.Forms.TabPage LogsTab;
        private System.Windows.Forms.TabPage GraphTab;
    }
}

