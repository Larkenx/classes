using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Project_One
{
    public partial class formProjectOne : Form
    {
        public formProjectOne()
        {
            InitializeComponent();
        }

        private void btnSelectPicture_Click(object sender, EventArgs e)
        {
            // Our user has clicked the select picture button
            // We need to open up a file dialog so they can choose an image (one of bmp, jpeg, or jpg)
            if (ofdSelectPicture.ShowDialog() == DialogResult.OK)
            {
                // If we get here, the user selected a proper file
                // Let's get the filename from the dialog box, and set it the picture box image to be the chosen file
                picShowPicture.Image = Image.FromFile(ofdSelectPicture.FileName);
                // We'll also adjust the text of the form itself to show the picture's filename
                Text = string.Concat("Project One (" + ofdSelectPicture.FileName + ")");
            }
        }

        private void btnQuit_Click(object sender, EventArgs e)
        {
            // When a user clicks the quit button, close the program gracefully (not the red 'x')
            Close();
        }
    }
}
