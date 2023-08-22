#include "helpers.h"

void colorize(int height, int width, RGBTRIPLE image[height][width])
{
    // Change all black pixels to a color of your choosing
    for (int row = 0; row < width; row++)
    {
        for (int col = 0; col < height; col++)
        {
            if (image[col][row].rgbtBlue == 0 && image[col][row].rgbtGreen == 0 && image[col][row].rgbtRed == 0)
            {
                image[col][row].rgbtBlue = 235;
                image[col][row].rgbtGreen = 115;
                image[col][row].rgbtRed = 44;
            }
        }
    }
}
