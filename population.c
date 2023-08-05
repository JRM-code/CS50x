#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int popStart;
    int popEnd;
    int population;
    int years;

    do {
        popStart = get_int("Start size: ");
    }
    while (popStart <= 8);

    do {
        popEnd = get_int("End size: ");
    }
    while (popEnd < popStart);

    if (popStart == popEnd) {
        years = 0;
        printf("Years: %i\n", years);
    }

     else { while (popEnd > popStart) {
            population = popStart + (popStart / 3) - (popStart /4);
            popStart = population;
            years = years + 1;
    }
            printf("Years: %i\n", years);
    }

}
