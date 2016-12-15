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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PageRank));
            this.txt_DisplayLinks = new System.Windows.Forms.TextBox();
            this.txt_targetPage = new System.Windows.Forms.TextBox();
            this.btn_Search = new System.Windows.Forms.Button();
            this.cbo_RecursionDepth = new System.Windows.Forms.ComboBox();
            this.TabsContainer = new System.Windows.Forms.TabControl();
            this.LogsTab = new System.Windows.Forms.TabPage();
            this.splitContainer_LogsTreeView = new System.Windows.Forms.SplitContainer();
            this.treeView = new System.Windows.Forms.TreeView();
            this.GraphTab = new System.Windows.Forms.TabPage();
            this.chkbox_stripPrefixes = new System.Windows.Forms.CheckBox();
            this.btn_Exit = new System.Windows.Forms.Button();
            this.chkbox_excludeLocal = new System.Windows.Forms.CheckBox();
            this.chkbox_AllowMultEdges = new System.Windows.Forms.CheckBox();
            this.lbl_Neighbors = new System.Windows.Forms.Label();
            this.grpBox_SearchSettings = new System.Windows.Forms.GroupBox();
            this.chkbox_stripSuffixes = new System.Windows.Forms.CheckBox();
            this.lbl_targetPage = new System.Windows.Forms.Label();
            this.TabsContainer.SuspendLayout();
            this.LogsTab.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer_LogsTreeView)).BeginInit();
            this.splitContainer_LogsTreeView.Panel1.SuspendLayout();
            this.splitContainer_LogsTreeView.Panel2.SuspendLayout();
            this.splitContainer_LogsTreeView.SuspendLayout();
            this.grpBox_SearchSettings.SuspendLayout();
            this.SuspendLayout();
            // 
            // txt_DisplayLinks
            // 
            this.txt_DisplayLinks.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txt_DisplayLinks.Font = new System.Drawing.Font("Consolas", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_DisplayLinks.Location = new System.Drawing.Point(0, 0);
            this.txt_DisplayLinks.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txt_DisplayLinks.Multiline = true;
            this.txt_DisplayLinks.Name = "txt_DisplayLinks";
            this.txt_DisplayLinks.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txt_DisplayLinks.Size = new System.Drawing.Size(512, 783);
            this.txt_DisplayLinks.TabIndex = 0;
            this.txt_DisplayLinks.WordWrap = false;
            // 
            // txt_targetPage
            // 
            this.txt_targetPage.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.5F);
            this.txt_targetPage.Location = new System.Drawing.Point(15, 102);
            this.txt_targetPage.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txt_targetPage.Name = "txt_targetPage";
            this.txt_targetPage.ScrollBars = System.Windows.Forms.ScrollBars.Horizontal;
            this.txt_targetPage.Size = new System.Drawing.Size(458, 27);
            this.txt_targetPage.TabIndex = 1;
            this.txt_targetPage.Text = "Type in a URL and search...";
            this.txt_targetPage.Click += new System.EventHandler(this.txt_targetPage_Click);
            // 
            // btn_Search
            // 
            this.btn_Search.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btn_Search.Location = new System.Drawing.Point(16, 775);
            this.btn_Search.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btn_Search.Name = "btn_Search";
            this.btn_Search.Size = new System.Drawing.Size(153, 52);
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
            this.cbo_RecursionDepth.Location = new System.Drawing.Point(364, 171);
            this.cbo_RecursionDepth.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cbo_RecursionDepth.Name = "cbo_RecursionDepth";
            this.cbo_RecursionDepth.Size = new System.Drawing.Size(61, 28);
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
            this.TabsContainer.Location = new System.Drawing.Point(510, 2);
            this.TabsContainer.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.TabsContainer.Name = "TabsContainer";
            this.TabsContainer.SelectedIndex = 0;
            this.TabsContainer.Size = new System.Drawing.Size(1128, 826);
            this.TabsContainer.SizeMode = System.Windows.Forms.TabSizeMode.FillToRight;
            this.TabsContainer.TabIndex = 4;
            // 
            // LogsTab
            // 
            this.LogsTab.Controls.Add(this.splitContainer_LogsTreeView);
            this.LogsTab.Location = new System.Drawing.Point(4, 29);
            this.LogsTab.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.LogsTab.Name = "LogsTab";
            this.LogsTab.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.LogsTab.Size = new System.Drawing.Size(1120, 793);
            this.LogsTab.TabIndex = 0;
            this.LogsTab.Text = "Logs / Tree Viewer";
            this.LogsTab.UseVisualStyleBackColor = true;
            // 
            // splitContainer_LogsTreeView
            // 
            this.splitContainer_LogsTreeView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer_LogsTreeView.Location = new System.Drawing.Point(4, 5);
            this.splitContainer_LogsTreeView.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.splitContainer_LogsTreeView.Name = "splitContainer_LogsTreeView";
            // 
            // splitContainer_LogsTreeView.Panel1
            // 
            this.splitContainer_LogsTreeView.Panel1.Controls.Add(this.txt_DisplayLinks);
            // 
            // splitContainer_LogsTreeView.Panel2
            // 
            this.splitContainer_LogsTreeView.Panel2.Controls.Add(this.treeView);
            this.splitContainer_LogsTreeView.Size = new System.Drawing.Size(1112, 783);
            this.splitContainer_LogsTreeView.SplitterDistance = 512;
            this.splitContainer_LogsTreeView.SplitterWidth = 6;
            this.splitContainer_LogsTreeView.TabIndex = 14;
            // 
            // treeView
            // 
            this.treeView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.treeView.Location = new System.Drawing.Point(0, 0);
            this.treeView.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.treeView.Name = "treeView";
            this.treeView.Size = new System.Drawing.Size(594, 783);
            this.treeView.TabIndex = 1;
            // 
            // GraphTab
            // 
            this.GraphTab.Location = new System.Drawing.Point(4, 29);
            this.GraphTab.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.GraphTab.Name = "GraphTab";
            this.GraphTab.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.GraphTab.Size = new System.Drawing.Size(1120, 793);
            this.GraphTab.TabIndex = 1;
            this.GraphTab.Text = "Graph View";
            this.GraphTab.UseVisualStyleBackColor = true;
            // 
            // chkbox_stripPrefixes
            // 
            this.chkbox_stripPrefixes.Location = new System.Drawing.Point(4, 162);
            this.chkbox_stripPrefixes.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.chkbox_stripPrefixes.Name = "chkbox_stripPrefixes";
            this.chkbox_stripPrefixes.Size = new System.Drawing.Size(440, 114);
            this.chkbox_stripPrefixes.TabIndex = 5;
            this.chkbox_stripPrefixes.Text = "Enable prefix stripping. This does not effect the search space of the application" +
    ". It simply improves the aesthetic of the graph visualization by removing \"http(" +
    "s)://\" from the beginning of each link.";
            this.chkbox_stripPrefixes.UseVisualStyleBackColor = true;
            // 
            // btn_Exit
            // 
            this.btn_Exit.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btn_Exit.Location = new System.Drawing.Point(322, 775);
            this.btn_Exit.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btn_Exit.Name = "btn_Exit";
            this.btn_Exit.Size = new System.Drawing.Size(153, 52);
            this.btn_Exit.TabIndex = 6;
            this.btn_Exit.Text = "Exit";
            this.btn_Exit.UseVisualStyleBackColor = true;
            this.btn_Exit.Click += new System.EventHandler(this.btn_Exit_Click);
            // 
            // chkbox_excludeLocal
            // 
            this.chkbox_excludeLocal.Location = new System.Drawing.Point(9, 285);
            this.chkbox_excludeLocal.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.chkbox_excludeLocal.Name = "chkbox_excludeLocal";
            this.chkbox_excludeLocal.Size = new System.Drawing.Size(440, 120);
            this.chkbox_excludeLocal.TabIndex = 7;
            this.chkbox_excludeLocal.Text = resources.GetString("chkbox_excludeLocal.Text");
            this.chkbox_excludeLocal.UseVisualStyleBackColor = true;
            // 
            // chkbox_AllowMultEdges
            // 
            this.chkbox_AllowMultEdges.Location = new System.Drawing.Point(9, 409);
            this.chkbox_AllowMultEdges.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.chkbox_AllowMultEdges.Name = "chkbox_AllowMultEdges";
            this.chkbox_AllowMultEdges.Size = new System.Drawing.Size(440, 114);
            this.chkbox_AllowMultEdges.TabIndex = 8;
            this.chkbox_AllowMultEdges.Text = "Allow duplicate paths/edges. This allows sites that have multiple links to the sa" +
    "me page to form more than one link to another page. This can slow down the appli" +
    "cation significantly.\r\n";
            this.chkbox_AllowMultEdges.UseVisualStyleBackColor = true;
            // 
            // lbl_Neighbors
            // 
            this.lbl_Neighbors.Location = new System.Drawing.Point(18, 146);
            this.lbl_Neighbors.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbl_Neighbors.Name = "lbl_Neighbors";
            this.lbl_Neighbors.Size = new System.Drawing.Size(309, 83);
            this.lbl_Neighbors.TabIndex = 9;
            this.lbl_Neighbors.Text = "Select the number of times you want the application to scrape links from children" +
    " links. A recursion depth greater than zero or one can take a very long time to " +
    "load! ";
            // 
            // grpBox_SearchSettings
            // 
            this.grpBox_SearchSettings.Controls.Add(this.chkbox_stripSuffixes);
            this.grpBox_SearchSettings.Controls.Add(this.chkbox_AllowMultEdges);
            this.grpBox_SearchSettings.Controls.Add(this.chkbox_excludeLocal);
            this.grpBox_SearchSettings.Controls.Add(this.chkbox_stripPrefixes);
            this.grpBox_SearchSettings.Location = new System.Drawing.Point(18, 234);
            this.grpBox_SearchSettings.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.grpBox_SearchSettings.Name = "grpBox_SearchSettings";
            this.grpBox_SearchSettings.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.grpBox_SearchSettings.Size = new System.Drawing.Size(458, 532);
            this.grpBox_SearchSettings.TabIndex = 10;
            this.grpBox_SearchSettings.TabStop = false;
            this.grpBox_SearchSettings.Text = "Settings";
            // 
            // chkbox_stripSuffixes
            // 
            this.chkbox_stripSuffixes.Location = new System.Drawing.Point(9, 29);
            this.chkbox_stripSuffixes.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.chkbox_stripSuffixes.Name = "chkbox_stripSuffixes";
            this.chkbox_stripSuffixes.Size = new System.Drawing.Size(440, 143);
            this.chkbox_stripSuffixes.TabIndex = 10;
            this.chkbox_stripSuffixes.Text = resources.GetString("chkbox_stripSuffixes.Text");
            this.chkbox_stripSuffixes.UseVisualStyleBackColor = true;
            // 
            // lbl_targetPage
            // 
            this.lbl_targetPage.Location = new System.Drawing.Point(12, 15);
            this.lbl_targetPage.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbl_targetPage.Name = "lbl_targetPage";
            this.lbl_targetPage.Size = new System.Drawing.Size(464, 82);
            this.lbl_targetPage.TabIndex = 11;
            this.lbl_targetPage.Text = resources.GetString("lbl_targetPage.Text");
            // 
            // PageRank
            // 
            this.AcceptButton = this.btn_Search;
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightGray;
            this.ClientSize = new System.Drawing.Size(1656, 846);
            this.Controls.Add(this.lbl_targetPage);
            this.Controls.Add(this.grpBox_SearchSettings);
            this.Controls.Add(this.lbl_Neighbors);
            this.Controls.Add(this.btn_Exit);
            this.Controls.Add(this.cbo_RecursionDepth);
            this.Controls.Add(this.TabsContainer);
            this.Controls.Add(this.btn_Search);
            this.Controls.Add(this.txt_targetPage);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.MinimumSize = new System.Drawing.Size(1669, 876);
            this.Name = "PageRank";
            this.Text = "Web Crawler Visualizer";
            this.TabsContainer.ResumeLayout(false);
            this.LogsTab.ResumeLayout(false);
            this.splitContainer_LogsTreeView.Panel1.ResumeLayout(false);
            this.splitContainer_LogsTreeView.Panel1.PerformLayout();
            this.splitContainer_LogsTreeView.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer_LogsTreeView)).EndInit();
            this.splitContainer_LogsTreeView.ResumeLayout(false);
            this.grpBox_SearchSettings.ResumeLayout(false);
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
        private System.Windows.Forms.CheckBox chkbox_stripPrefixes;
        private System.Windows.Forms.Button btn_Exit;
        private System.Windows.Forms.CheckBox chkbox_excludeLocal;
        private System.Windows.Forms.CheckBox chkbox_AllowMultEdges;
        private System.Windows.Forms.Label lbl_Neighbors;
        private System.Windows.Forms.GroupBox grpBox_SearchSettings;
        private System.Windows.Forms.CheckBox chkbox_stripSuffixes;
        private System.Windows.Forms.Label lbl_targetPage;
        private System.Windows.Forms.TreeView treeView;
        private System.Windows.Forms.SplitContainer splitContainer_LogsTreeView;
    }
}

