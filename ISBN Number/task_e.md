**ISBN Number**

**Problem description**

Every officially published book has an ISBN number corresponding to it. The ISBN code consists of nine digits, one identifier, and three separators in a prescribed format such as "x-xxx-xxxxx-x", where the symbol "-" is the separator (the minus sign on the keyboard), and the last digit is the identifier. For example, 0-670-82162-4 is a standard ISBN code. The first digit of the ISBN code indicates the language in which the book is published. For example, 0 represents English. The three numbers after the first separator "-" represent the publishing house. For example, 670 represents Viking Press. The five digits after the second separation represent the book's publisher number; The last bit is the identification number.

The identification number is calculated as follows:

Multiply the first digit by 1 and plus the second digit multiply by 2\... and so on, with the result mod 11, the remainder is the identifier, and if the remainder is 10, the identifier is a capital X. For example, the identification number 4 in the ISBN number 0-670-82162-4 is obtained as follows: multiply the nine numbers 067082162 from left to right by 1, 2\..., 9, and the sum is 0×1+6×2+\...+2×9=158, and then take the result 4 of 158 mod 11 as the identification code.

Your task is to write a program that determines whether the identifier is correct in the ISBN number entered, and if it is correct, simply output "Right". If not, output the ISBN number you think is correct.

**Input**

The input file is a one-line sequence of characters representing the ISBN number of a book (ensure that the input meets the format requirements for ISBN numbers).

**Output**

The output file has one line. If the input ISBN number identifier is correct, the output is "Right". Otherwise, the output is the correct ISBN number (including the separator "-") in the specified format.

**Sample Input 1**

0-670-82162-4

**Sample Output 1**

Right

**Sample Input 2**

0-670-82162-0

**Sample Output 2**

0-670-82162-4
