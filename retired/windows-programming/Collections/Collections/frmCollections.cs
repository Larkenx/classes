﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Collections
{
    public partial class frmCollections : Form
    {
        public frmCollections()
        {
            InitializeComponent();
        }

        private void btnShowNames_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < Controls.Count; i++)
            {
                MessageBox.Show("Control #" + i.ToString() + " has the name " + Controls[i].Name);
            }
        }

        private void frmCollections_Load(object sender, EventArgs e)
        {

        }

        private void btnOptions_Click(object sender, EventArgs e)
        {
            frmBuffetOptions frmBuffetOptionsDialog = new frmBuffetOptions();
            frmBuffetOptionsDialog.Show();
        }
    }
}
