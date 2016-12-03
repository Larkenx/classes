/* Author: Steven Myers
 * Username: stelmyer
 * Date Created: 12/2/2016
 * Last Modified by: Steven Myers
 * Assignment: RPNCalculator, A290 Homework Project 3
 * */


using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RPNCalculator
{
    public partial class frmRPNCalculator : Form
    {

        public frmRPNCalculator()
        {
            InitializeComponent();
        }

        // To be used when user presses clear button
        private void clearNumbers()
        {
            // Set all of our text boxes to be empty strings
            txtAnswer.Text = "";
            txtFirstNum.Text = "";
            txtSecondNum.Text = "";
        }

        /* This function accepts a function that takes two arguments, and returns a double as a result. */
        private void calculateResult(Func<double, double, double> f) {
            // We'll use x and y to store our double representations of the entered numbers
            double x, y;
            // We'll also use sx and sy to store the string representations of the entered numbers
            String sx = txtFirstNum.Text, sy = txtSecondNum.Text;
            // If we can properly parse both of the strings into doubles, we can evaluate using the function above
            if (double.TryParse(sx, out x) && double.TryParse(sy, out y))
            {
                // We successfully parsed the strings into the x and y variables.
                // Now we can call the function handed into this function on our two double variables,
                // and convert the result into a string and set it to be the answer textbox text.
                double result = f(x, y);
                // It's possible that the user puts in a user that we can't represent with double precision,
                // In that case let's let the user know it's too large and fill the answer box with text saying it's larger
                // than the max value.
                if (Double.IsInfinity(result))
                {
                    MessageBox.Show("Number cannot be represented because it's too large!");
                    txtAnswer.Text = "> " +  Double.MaxValue.ToString();
                } else
                {
                    txtAnswer.Text = result.ToString();
                }

            } else
            {
                // If we couldn't parse either sx or sy, they didn't put in proper input. Prompt them to try again.
                MessageBox.Show("Invalid input. Please enter numbers into the two text boxes. Press Clear and try again.");
            }
        }

        private void frmRPNCalculator_Load(object sender, EventArgs e)
        {

        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            // exit the program gracefully
            Close();
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            // Set all of our text boxes to be empty strings
            clearNumbers();
        }

        /* For all of the following click events, they call the calculate result function and
         * supply a function that accepts two double parameters, and returns a double. The syntax
         * is similar to that of lambda statements in Java. All of the operators are fairly straightforward
         * except for the min and max functions. */

        private void btnSubt_Click(object sender, EventArgs e)
        {
            calculateResult((x, y) => x - y);
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            calculateResult((x, y) => x + y);
        }

        private void btnMult_Click(object sender, EventArgs e)
        {
            calculateResult((x, y) => x * y);
        }

        private void btnDiv_Click(object sender, EventArgs e)
        {
            calculateResult((x, y) => x / y);
        }

        private void btnPow_Click(object sender, EventArgs e)
        {
            calculateResult((x, y) => Math.Pow(x, y));
        }

        private void btnModulo_Click(object sender, EventArgs e)
        {
            calculateResult((x, y) => x % y);
        }

        // Takes the minimum of both numbers. If they are equivalent, sets the answer to be x (since both are the same).
        private void btnMin_Click(object sender, EventArgs e)
        {
            // The function we're handing in here is doing a little bit of magic.
            // We're doing a one line conditional statement using the ? operator.
            // Math.Min(double x, double y) returns NaN if x == y. So, we check to see
            // if Math.min(x, y) returns NaN. If so, we can return either x or y since they
            // are equivalent. If it doesn't return NaN, then we just return the minimum value.
            calculateResult((x, y) => Double.IsNaN(Math.Min(x, y)) ? x : Math.Min(x, y));
        }

        // Takes the maximum of both numbers. If they are equivalent, sets the answer to be x (since both are the same).
        private void btnMax_Click(object sender, EventArgs e)
        {
            // Same as above, but for max.
            calculateResult((x, y) => Double.IsNaN(Math.Max(x, y)) ? x : Math.Max(x, y));
        }
    }
}
