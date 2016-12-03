For my design choices in this project, I chose to use a horizontal layout because
I felt that vertical layouts are only good for calculators that don't use more than one text box (non-RPN).
I made sure to group all of the operators together, equally spaced on the left side, with the exception of the
clear button which is in the upper right-hand corner. I didn't want a user to accidentally click on the clear button
when attempting to user an operator.

Having the three text boxes in a row helps with consistency of design as well. I think an exit button typically rests in the lower
right too. Finally, I made sure to make all of the buttons have "hand" cursor attributes.

My code is well documented and should speak mostly for itself. I made a lot of use of C#'s shorter, cleaner syntax
and operators to make a lot of one-line, easy-to-read and understand statements. I also decided to approach the data validation
slighlty different than it was presented in class. It validates input when a user calculates their answer instead.
Finally, I added a check to see whether or not the user entered a number larger than what we can represent in double precision
and prompted them accordingly to let them know that.