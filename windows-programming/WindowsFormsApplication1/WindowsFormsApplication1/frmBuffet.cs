using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class frmBuffet : Form
    {
        public frmBuffet()
        {
            InitializeComponent();

        }

        private void btnSelectPicture_Click(object sender, EventArgs e)
        {
            if (ofdSelectPicture.ShowDialog() == DialogResult.OK)
            {
                // Show the open file dialog box to select a picture
                picShowPicture.Image = Image.FromFile(ofdSelectPicture.FileName);

                // Show the name of the file in the form's caption

                Text = string.Concat("A290 Buffet (" + ofdSelectPicture.FileName + ")");
            }
        }

        private void btnQuit_Click(object sender, EventArgs e)
        {
            // Exit the program gracefully
            Close();
        }

        private void btnShrink_Click(object sender, EventArgs e)
        {
            // Decrement the form width and height
            Width = Width - 20;
            Height = Height - 20;
        }

        private void btnEnlarge_Click(object sender, EventArgs e)
        {
            // Increment the form width and height
            Width += 20;
            Height += 20;
        }

        private void btnDrawBorder_Click(object sender, EventArgs e)
        {
            // Create a new graphics object and set it to null
            Graphics objDrawBorder = null;
            objDrawBorder = CreateGraphics();
            // Clear the systemcolors control
            objDrawBorder.Clear(SystemColors.Control);
            // Now we can draw a rectangle of which will wrap around the picturebox
            objDrawBorder.DrawRectangle(Pens.Blue,
                picShowPicture.Left - 1, picShowPicture.Top - 1,
                picShowPicture.Width + 1, picShowPicture.Height + 1);
            // to finish up, we need to dispose the graphics object so its
            // resources can be used elsewhere.
            objDrawBorder.Dispose();
        }

        private void picShowPicture_MouseMove(object sender, MouseEventArgs e)
        {
            // When we move our mouse within the picturebox, display the mouse X, Y coordinates
            // in the labels we created
            lblX.Text = "X: " + e.X.ToString();
            lblY.Text = "Y: " + e.Y.ToString();

        }

        private void frmBuffet_Load(object sender, EventArgs e)
        {
            // When the form loads, make the labels hidden (empty text)
            lblX.Text = "";
            lblY.Text = "";
        }

        private void picShowPicture_MouseLeave(object sender, EventArgs e)
        {
            // When we leave the picturebox, make the labels hidden (empty text)
            lblX.Text = "";
            lblY.Text = "";
        }

        private void btnOptions_Click(object sender, EventArgs e)
        {
            // Instantiate a new frmBuffetOptions class and show it when we click on the
            // button options
            frmBuffetOptions frmBuffetOptionsDialog = new frmBuffetOptions();
            frmBuffetOptionsDialog.ShowDialog();
        }
    }
}
