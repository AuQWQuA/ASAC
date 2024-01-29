**2^k^ System of Numeration**

**Problem description**

Let r be a 2^k^ system of numeration and satisfy the following conditions:

1.  r is at least a 2 digit 2^k^ system of numeration.

2.  As a 2^k^ system of numeration, every digit of r except the last digit is strictly smaller than its neighboring digit to the right.

3.  After r is converted into a binary number q, the total number of digits of q does not exceed w.

Here, the positive integers k and w are given in advance.

Question is: How many different r satisfy the above conditions?

Let's try to explain it in a different way: Let S be a 01 string of length w (that is, the string S consists of w 0 or 1), and S corresponds to q in condition 3 above. Divide S from the right into many segments of length k, each segment corresponds to a 2^k^ system of numeration. If S can be divided into at least two segments, the binary number corresponding to S can be converted to the above 2^k^ system of numeration r.

Example: Let k=3, w=7. r is an octal number (2^3^=8). Since w=7, the 01 string of length 7 can be divided into 3 segments by 3 digits (i.e. 1,3,3, the first left segment has only one binary digit), then the octal numbers that satisfy the condition are:

2 digits:

The highest digit is 1: 6 (i.e. 12,13,14,15,16,17)

The highest digit is 2: 5,

\...

The highest digit is 6: 1 (i.e. 67).

A total of 6 + 5 +\... + 1 = 21.

3 digits:

The highest digit can only be 1,

The second digit is 2: 5 (i.e. 123,124,125,126,127),

the second digit is 3: 4,

\... ,

The second digit is 6: 1 (i.e. 167).

A total of 5 + 4 +\... + 1 = 15.

So there are a total of 36 r that satisfy our requirement.

**Input**

The input file contains only one line of two positive integers k, w, separated by a space.

**Output**

The output file is one line, which contains a positive integer. It is the calculation result, the number of different r that meet the conditions (expressed in decimal number), the highest digit must not be 0, and characters other than numbers (such as spaces, newline characters, commas, etc.) shall not be inserted between the digits.

(Hint: The resulting positive integer may be large, but not more than 200 digits)

**Sample Input**

3 7

**Sample Output**

36

**Hint**

**\[Data Range\]**

1 ≤ k ≤ 9

1 ≤ w ≤ 3 × 10^4^
