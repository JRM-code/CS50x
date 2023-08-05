#include <cs50.h>
#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

int count_letters(string text);
int count_words(string text);
int count_sentences(string text);

int main(void)
{
    /// Gets text from user.
    string text = get_string("Enter text: ");

    /// Gets return values from functions.
    float letters = count_letters(text);

    float words = count_words(text);

    float sentences = count_sentences(text);

    /// Calculates the grade.
    float L = letters / words * 100;
    float S = sentences / words * 100;

    int grade = round(0.0588 * L - 0.296 * S - 15.8);

    /// Takes grade and prints the relevant message.
    if (grade < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (grade >= 16)
    {
        printf("Grade 16+\n");
    }
    else
    {
        printf("Grade %i\n", grade);
    }
}

/// Functions. Count letters, words and sentences.
int count_letters(string text)
{
    int letters = 0;
    for (int i = 0; i < strlen(text); i++)
    {
        if (isalpha(text[i]))
            letters++;
    }
    return letters;
}

int count_words(string text)
{
    int words = 1;
    for (int i = 0; i < strlen(text); i++)
    {
        if (text[i] == ' ')
            words++;
    }
    return words;
}

int count_sentences(string text)
{
    int sentences = 0;
    for (int i = 0; i < strlen(text); i++)
    {
        if (text[i] == '.' || text[i] == '!' || text[i] == '?')
            sentences++;
    }
    return sentences;
}
