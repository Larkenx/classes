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
        bool borderDrawn = false;

        public formProjectOne()
        {
            InitializeComponent();
        }

        /* Function to draw border around picShowPicture element, to be used in click function for
           btnDrawBorder and the resizing of the form*/
        private void drawPicShowPictureBorder()
        {
            // Create a variable of type Graphics and set it to null
            Graphics objDrawBorder = null;
            // Instantiate the graphics object
            objDrawBorder = CreateGraphics();
            // Clear the system colors
            objDrawBorder.Clear(SystemColors.Control);
            // Now let's draw a rectangle using our graphics object
            objDrawBorder.DrawRectangle(Pens.Blue, // We use the color blue
                picShowPicture.Left - 1, picShowPicture.Top - 1, // Begin drawing at uppper level corner of pic box
                picShowPicture.Width + 1, picShowPicture.Height + 1); // Extend to the bottom, right corner

            // Finally, free up the resources used by the Graphics object
            objDrawBorder.Dispose();

            // Set our borderDrawn field for this form to be true, indicating a border has been drawn
            borderDrawn = true;
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

        private void btnEnlarge_Click(object sender, EventArgs e)
        {
            // Increase the size of the form window
            Width += 20;
            Height += 20;

            // If the border has been drawn, we need to redraw it correctly to fit the new size
            if (borderDrawn)
            {
                drawPicShowPictureBorder();
            }
        }

        private void btnShrink_Click(object sender, EventArgs e)
        {
            // Decrease the size of the form window
            Width -= 20;
            Height -= 20;
            // If the border has been drawn, we need to redraw it correctly to fit the new size
            if (borderDrawn)
            {
                drawPicShowPictureBorder();

            }
        }

        private void btnDrawBorder_Click(object sender, EventArgs e)
        {
            // Call the predefined function to draw a border around the picShowPicture form element when
            // the 'drawBorder' button is clicked.
            drawPicShowPictureBorder();
        }

        private void picShowPicture_MouseMove(object sender, MouseEventArgs e)
        {
            // When a user mouses over the picture box, we want to display the mouse coordinates in these labels.
            lblX.Text = "X: " + e.X.ToString();
            lblY.Text = "Y: " + e.Y.ToString();
        }

        private void picShowPicture_MouseLeave(object sender, EventArgs e)
        {
            // When a user's mouse leaves the picture box, we don't want to display the coordinates anymore.
            // We can just simply set the label text to be an empty string
            lblX.Text = "";
            lblY.Text = "";

        }

        private void formProjectOne_Resize(object sender, EventArgs e)
        {
            // If the border has been drawn, we need to redraw it correctly to fit the new size
            if (borderDrawn)
            {
                drawPicShowPictureBorder();

            }
        }
    }
}
