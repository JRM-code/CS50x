#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
typedef uint8_t BYTE;

int main(int argc, char *argv[])
{
    // Check correct argument count
    if (argc != 2)
    {
        printf("Usage: ./recover IMAGE\n");
        return 1;
    }
    // Open a file for reading
    FILE *input_file = fopen(argv[1], "r");

    // Check validity of file
    if (input_file == NULL)
    {
        printf("The file is not valid");
        return 2;
    }
    // Store 512byte blocks
    unsigned char buffer[512];

    // Count images
    int img_count = 0;

    // File pointer for recovery
    FILE *output_file = NULL;

    char *filename = malloc(8 * sizeof(char));

    // Read 512byte blocks
    while (fread(buffer, sizeof(char), 512, input_file))
    {
        // Check if bytes are jpeg header
        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff && (buffer[3] & 0xf0) == 0xe0)
        {
            sprintf(filename, "%03i.jpg", img_count);

            output_file = fopen(filename, "w");

            img_count++;
        }
        if (output_file != NULL)
        {
            fwrite(buffer, sizeof(char), 512, output_file);
        }
    }
    fclose(output_file);
    fclose(input_file);
    free(filename);

    return 0;
}