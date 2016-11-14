using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Project_Two
{
    public partial class frmBuffetOptions : Form
    {
        public frmBuffetOptions()
        {
            InitializeComponent();
        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void optBackgroundRed_CheckedChanged(object sender, EventArgs e)
        {
            // Change the background color of the options form to red
            BackColor = Color.Red; 
        }

        private void optBackgroundBlue_CheckedChanged(object sender, EventArgs e)
        {
            // Change the background color of the options form to blue
            BackColor = Color.Blue;
        }

        private void optBackgroundGreen_CheckedChanged(object sender, EventArgs e)
        {
            // Change the background color of the options form to red
            BackColor = Color.Green;
        }

        private void optBackgroundDefault_CheckedChanged(object sender, EventArgs e)
        {
            // Change the background color of the options form to default color
            BackColor = Color.FromArgb(0, 192, 192);
        }

        private void cboBorderColors_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Let's create a switch statement that evaluates based on the
            // selected combobox text
            switch(cboBorderColors.Text)
            {
                // If the user selected Cyan:
                case "Cyan":
                    // Show the user that cyan was chosen in the message box
                    MessageBox.Show("Cyan was chosen");
                    // Create and instantiate our graphics object, then clear the current systemcolors.control
                    Graphics objGraphicsCyan = null;
                    objGraphicsCyan = CreateGraphics();
                    objGraphicsCyan.Clear(SystemColors.Control);
                    // Now draw a blue rectangle
                    objGraphicsCyan.DrawRectangle(Pens.Blue, Width + 2, Height + 2 , Width - 2, Height - 2);
                    break;

                case "Purple":
                    break;

                case "Yellow":
                    break;

                default:
                    break;
            }
        }
    }
}
