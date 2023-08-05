#include <cs50.h>
#include <stdio.h>

int main(void)
{
    /// Initialise variables.
    int getHeight, width, col, spaces;

    /// Get the user input as an integer between 1 and 8.
    do
    {
        getHeight = get_int("Enter a number: ");
    }
    while (getHeight <= 0 || getHeight > 8);

    /// Repeat the code for the given number and print the required blocks.
    for (width = 0; width < getHeight; width++)
    {
        for (spaces = 0; spaces < getHeight - width - 1; spaces++)
        {
            printf(" ");
        }
        for (col = 0; col <= width; col++)
        {
            printf("#");
        }
        printf("\n");
    }
}
