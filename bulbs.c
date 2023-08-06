#include <cs50.h>
#include <stdio.h>
#include <string.h>

const int BITS_IN_BYTE = 8;

void print_bulb(int bit);

int main(void)
{
    /// Get user message.
    string message = get_string("Enter your message: ");

    /// Loop through characters in message.
    for (int i = 0; i < strlen(message); i++)
    {
        /// Convert message to ASCII.
        int ascii = (message[i]);

        /// Convert message from ASCII to binary.
        int binary[] = {0, 0, 0, 0, 0, 0, 0, 0}; /// Empty array to store binary numbers.
        int n = 0;

        while (ascii > 0)
        {
            binary[n] = ascii % 2;
            ascii = ascii / 2;
            n++;
        }
        /// Reverse bulb order.
        for (int j = BITS_IN_BYTE - 1; j >= 0; j--)
        {
            print_bulb(binary[j]);
        }
        printf("\n");
    }
}

void print_bulb(int bit)
{
    if (bit == 0)
    {
        // Dark emoji
        printf("\U000026AB");
    }
    else if (bit == 1)
    {
        // Light emoji
        printf("\U0001F7E1");
    }
}
