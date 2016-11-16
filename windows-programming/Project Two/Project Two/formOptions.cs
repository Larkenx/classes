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
    public partial class formOptions : Form
    {

        /* Border and Back Color variables for drawBorder/checkbox options*/
        Pen borderColor = new Pen(Color.WhiteSmoke, 5);
        Color bgColor = Color.WhiteSmoke;

        public formOptions()
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

        private void optBackgroundRed_CheckedChanged(object sender, EventArgs e)
        {
            // Change the background color of the options form to red
            bgColor = Color.Red;
            BackColor = bgColor;
            MessageBox.Show("Gets here");
            // Draw the border again
            drawBorder();
        }

        private void optBackgroundBlue_CheckedChanged(object sender, EventArgs e)
        {
            // Change the background color of the options form to blue
            bgColor = Color.Blue;
            BackColor = bgColor;
            // Draw the border again
            MessageBox.Show("Gets here");
            drawBorder();

        }

        private void optBackgroundGreen_CheckedChanged(object sender, EventArgs e)
        {
            // Change the background color of the options form to red
            bgColor = Color.Green;
            BackColor = bgColor;
            MessageBox.Show("Gets here");
            // Draw the border again
            drawBorder();

        }

        private void optBackgroundDefault_CheckedChanged(object sender, EventArgs e)
        {
            // Change the background color of the options form to default color
            bgColor = Color.WhiteSmoke;
            BackColor = bgColor;
            MessageBox.Show("Gets here");
            // Draw the border again
            drawBorder();

        }

        private void drawBorder ()
        {
            // Create and instantiate our graphics object, then clear the current systemcolors.control
            Graphics objGraphics = null;
            objGraphics = CreateGraphics();
            //objGraphics.Clear(bgColor);
            // Now draw a blue rectangle
            //MessageBox.Show("Drawing border with color" + borderColor.Color.ToString());
            objGraphics.DrawRectangle(borderColor, 0, 0, Width - 17, Height - 40);
            // Dispose the graphics object
            objGraphics.Dispose();
        }

        private void cboBorderColors_SelectedIndexChanged(object sender, EventArgs e)
        {

            // Let's create a switch statement that evaluates based on the
            // selected combobox text. We will use a single drawBorder function
            // in each case and pass the appropriate color in.
            switch (cboBorderColors.Text)
            {

                // If the user selected Cyan:
                case "Cyan":
                    // Show the user that cyan was chosen in the message box
                    MessageBox.Show("Cyan was chosen.");
                    borderColor.Color = Color.DarkCyan;
                    break;

                // If the user selected Purple:
                case "Purple":
                    // Show the user that purple was chosen in the message box
                    MessageBox.Show("Purple was chosen");
                    borderColor.Color = Color.Purple;
                    break;

                // If the user selected Yellow:
                case "Yellow":
                    // Show the user that yellow was chosen in the message box
                    MessageBox.Show("Yellow was chosen");
                    borderColor.Color = Color.DarkGoldenrod;
                    break;

                // If the user selected Orange:
                case "Orange":
                    // Show the user that orange was chosen in the message box
                    MessageBox.Show("Orange was chosen");
                    borderColor.Color = Color.DarkOrange;
                    break;

                case "Default":
                    // User reset back to default
                    MessageBox.Show("Returning to default border. Default was chosen.");
                    borderColor.Color = Color.WhiteSmoke;
                    break;

                default:
                    break;
            }
            // After we have altered (or not altered) the borderColor variable, draw the border
            drawBorder();
        }
    }
}
