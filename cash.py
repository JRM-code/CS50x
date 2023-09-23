# A program that calculates the minimum number of coins required to give a user change.

from cs50 import get_float

while True:
    change = get_float("How much change is owed (in dollars)? ") * 100
    if change > 0:
        break

quarters = 0
while change > 24:
    change = change - 25
    quarters += 1

dimes = 0
while change > 9:
    change = change - 10
    dimes += 1

nickels = 0
while change > 4:
    change = change - 5
    nickels += 1

pennies = 0
while change > 0:
    change = change - 1
    pennies += 1

tot_coins = quarters + dimes + nickels + pennies
print(tot_coins)
