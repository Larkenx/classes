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
            this.GraphTreeView = new System.Windows.Forms.TreeView();
            this.GraphTab = new System.Windows.Forms.TabPage();
            this.chkbox_stripPrefixes = new System.Windows.Forms.CheckBox();
            this.btn_Exit = new System.Windows.Forms.Button();
            this.chkbox_excludeLocal = new System.Windows.Forms.CheckBox();
            this.chkbox_AllowMultEdges = new System.Windows.Forms.CheckBox();
            this.lbl_Neighbors = new System.Windows.Forms.Label();
            this.numericUpDown1 = new System.Windows.Forms.NumericUpDown();
            this.TabsContainer.SuspendLayout();
            this.LogsTab.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).BeginInit();
            this.SuspendLayout();
            // 
            // txt_DisplayLinks
            // 
            this.txt_DisplayLinks.Dock = System.Windows.Forms.DockStyle.Left;
            this.txt_DisplayLinks.Font = new System.Drawing.Font("Consolas", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_DisplayLinks.Location = new System.Drawing.Point(4, 5);
            this.txt_DisplayLinks.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txt_DisplayLinks.Multiline = true;
            this.txt_DisplayLinks.Name = "txt_DisplayLinks";
            this.txt_DisplayLinks.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txt_DisplayLinks.Size = new System.Drawing.Size(788, 660);
            this.txt_DisplayLinks.TabIndex = 0;
            this.txt_DisplayLinks.WordWrap = false;
            // 
            // txt_targetPage
            // 
            this.txt_targetPage.Location = new System.Drawing.Point(16, 5);
            this.txt_targetPage.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txt_targetPage.Name = "txt_targetPage";
            this.txt_targetPage.ScrollBars = System.Windows.Forms.ScrollBars.Horizontal;
            this.txt_targetPage.Size = new System.Drawing.Size(439, 26);
            this.txt_targetPage.TabIndex = 1;
            this.txt_targetPage.Text = "Type in a URL and click search...";
            this.txt_targetPage.Click += new System.EventHandler(this.txt_targetPage_Click);
            // 
            // btn_Search
            // 
            this.btn_Search.Location = new System.Drawing.Point(466, 5);
            this.btn_Search.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btn_Search.Name = "btn_Search";
            this.btn_Search.Size = new System.Drawing.Size(144, 31);
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
            this.cbo_RecursionDepth.Location = new System.Drawing.Point(279, 38);
            this.cbo_RecursionDepth.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cbo_RecursionDepth.Name = "cbo_RecursionDepth";
            this.cbo_RecursionDepth.Size = new System.Drawing.Size(60, 28);
            this.cbo_RecursionDepth.TabIndex = 3;
            this.cbo_RecursionDepth.Text = "0";
            // 
            // TabsContainer
            // 
            this.TabsContainer.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.TabsContainer.Controls.Add(this.LogsTab);
            this.TabsContainer.Controls.Add(this.GraphTab);
            this.TabsContainer.Location = new System.Drawing.Point(0, 120);
            this.TabsContainer.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.TabsContainer.Name = "TabsContainer";
            this.TabsContainer.SelectedIndex = 0;
            this.TabsContainer.Size = new System.Drawing.Size(1605, 703);
            this.TabsContainer.SizeMode = System.Windows.Forms.TabSizeMode.FillToRight;
            this.TabsContainer.TabIndex = 4;
            // 
            // LogsTab
            // 
            this.LogsTab.Controls.Add(this.GraphTreeView);
            this.LogsTab.Controls.Add(this.txt_DisplayLinks);
            this.LogsTab.Location = new System.Drawing.Point(4, 29);
            this.LogsTab.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.LogsTab.Name = "LogsTab";
            this.LogsTab.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.LogsTab.Size = new System.Drawing.Size(1597, 670);
            this.LogsTab.TabIndex = 0;
            this.LogsTab.Text = "Logs";
            this.LogsTab.UseVisualStyleBackColor = true;
            // 
            // GraphTreeView
            // 
            this.GraphTreeView.Dock = System.Windows.Forms.DockStyle.Right;
            this.GraphTreeView.Location = new System.Drawing.Point(801, 5);
            this.GraphTreeView.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.GraphTreeView.Name = "GraphTreeView";
            this.GraphTreeView.Scrollable = false;
            this.GraphTreeView.Size = new System.Drawing.Size(792, 660);
            this.GraphTreeView.TabIndex = 1;
            // 
            // GraphTab
            // 
            this.GraphTab.Location = new System.Drawing.Point(4, 29);
            this.GraphTab.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.GraphTab.Name = "GraphTab";
            this.GraphTab.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.GraphTab.Size = new System.Drawing.Size(1597, 670);
            this.GraphTab.TabIndex = 1;
            this.GraphTab.Text = "Graph View";
            this.GraphTab.UseVisualStyleBackColor = true;
            // 
            // chkbox_stripPrefixes
            // 
            this.chkbox_stripPrefixes.AutoSize = true;
            this.chkbox_stripPrefixes.Location = new System.Drawing.Point(16, 86);
            this.chkbox_stripPrefixes.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.chkbox_stripPrefixes.Name = "chkbox_stripPrefixes";
            this.chkbox_stripPrefixes.Size = new System.Drawing.Size(154, 24);
            this.chkbox_stripPrefixes.TabIndex = 5;
            this.chkbox_stripPrefixes.Text = "Strip link prefixes";
            this.chkbox_stripPrefixes.UseVisualStyleBackColor = true;
            // 
            // btn_Exit
            // 
            this.btn_Exit.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.btn_Exit.Location = new System.Drawing.Point(1431, 18);
            this.btn_Exit.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btn_Exit.Name = "btn_Exit";
            this.btn_Exit.Size = new System.Drawing.Size(154, 45);
            this.btn_Exit.TabIndex = 6;
            this.btn_Exit.Text = "Exit";
            this.btn_Exit.UseVisualStyleBackColor = true;
            this.btn_Exit.Click += new System.EventHandler(this.btn_Exit_Click);
            // 
            // chkbox_excludeLocal
            // 
            this.chkbox_excludeLocal.AutoSize = true;
            this.chkbox_excludeLocal.Location = new System.Drawing.Point(186, 86);
            this.chkbox_excludeLocal.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.chkbox_excludeLocal.Name = "chkbox_excludeLocal";
            this.chkbox_excludeLocal.Size = new System.Drawing.Size(208, 24);
            this.chkbox_excludeLocal.TabIndex = 7;
            this.chkbox_excludeLocal.Text = "Exclude local web pages";
            this.chkbox_excludeLocal.UseVisualStyleBackColor = true;
            // 
            // chkbox_AllowMultEdges
            // 
            this.chkbox_AllowMultEdges.AutoSize = true;
            this.chkbox_AllowMultEdges.Location = new System.Drawing.Point(411, 86);
            this.chkbox_AllowMultEdges.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.chkbox_AllowMultEdges.Name = "chkbox_AllowMultEdges";
            this.chkbox_AllowMultEdges.Size = new System.Drawing.Size(188, 24);
            this.chkbox_AllowMultEdges.TabIndex = 8;
            this.chkbox_AllowMultEdges.Text = "Allow duplicate edges";
            this.chkbox_AllowMultEdges.UseVisualStyleBackColor = true;
            this.chkbox_AllowMultEdges.CheckedChanged += new System.EventHandler(this.chkbox_AllowMultEdges_CheckedChanged);
            // 
            // lbl_Neighbors
            // 
            this.lbl_Neighbors.AutoSize = true;
            this.lbl_Neighbors.Location = new System.Drawing.Point(12, 43);
            this.lbl_Neighbors.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbl_Neighbors.Name = "lbl_Neighbors";
            this.lbl_Neighbors.Size = new System.Drawing.Size(256, 20);
            this.lbl_Neighbors.TabIndex = 9;
            this.lbl_Neighbors.Text = "Select number of neighbors to visit:";
            // 
            // numericUpDown1
            // 
            this.numericUpDown1.Location = new System.Drawing.Point(987, 43);
            this.numericUpDown1.Name = "numericUpDown1";
            this.numericUpDown1.Size = new System.Drawing.Size(120, 26);
            this.numericUpDown1.TabIndex = 10;
            // 
            // PageRank
            // 
            this.AcceptButton = this.btn_Search;
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1604, 823);
            this.Controls.Add(this.numericUpDown1);
            this.Controls.Add(this.lbl_Neighbors);
            this.Controls.Add(this.chkbox_AllowMultEdges);
            this.Controls.Add(this.chkbox_excludeLocal);
            this.Controls.Add(this.btn_Exit);
            this.Controls.Add(this.chkbox_stripPrefixes);
            this.Controls.Add(this.TabsContainer);
            this.Controls.Add(this.cbo_RecursionDepth);
            this.Controls.Add(this.btn_Search);
            this.Controls.Add(this.txt_targetPage);
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "PageRank";
            this.Text = "Page Rank Application";
            this.TabsContainer.ResumeLayout(false);
            this.LogsTab.ResumeLayout(false);
            this.LogsTab.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).EndInit();
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
        private System.Windows.Forms.TreeView GraphTreeView;
        private System.Windows.Forms.CheckBox chkbox_stripPrefixes;
        private System.Windows.Forms.Button btn_Exit;
        private System.Windows.Forms.CheckBox chkbox_excludeLocal;
        private System.Windows.Forms.CheckBox chkbox_AllowMultEdges;
        private System.Windows.Forms.Label lbl_Neighbors;
        private System.Windows.Forms.NumericUpDown numericUpDown1;
    }
}

