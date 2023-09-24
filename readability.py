# Get text from user and compute the grade using the Coleman-Liau formula.
from cs50 import get_string

text = get_string("Please input your text: ")

letters = 0
words = 1
sentences = 0

for i in text:
    if i.isalpha():
        letters += 1
    elif i == " ":
        words += 1
    elif i == "." or i == "!" or i == "?":
        sentences += 1

L = float(letters / words * 100)
S = float(sentences / words * 100)

grade = round(0.0588 * L - 0.296 * S - 15.8)

if grade >= 16:
    print("Grade 16+")
elif grade < 1:
    print("Before Grade 1")
else:
    print("Grade:", grade)
