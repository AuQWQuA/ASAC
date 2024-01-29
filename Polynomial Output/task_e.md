**Polynomial Output**

**Problem description**

A polynomial of degree n in one variable can be expressed as follows:

f(x) = a~n~x^n^ + a~n-1~x^n-1^ + ... + a~1~x + a~0~, a~n~ ≠ 0

Where a~i~x^i^ is called the term of degree i and a~i~ is called the coefficient of the term of degree i. Given the degree and coefficient of the terms of a polynomial in one variable, please output the polynomial in the following format:

1.  The independent variable in the polynomial is x, and the polynomial is given in decreasing order of degree from left to right.

2.  The polynomial contains only the terms whose coefficients are not 0.

3.  If the coefficient of the polynomial of degree n is positive, the "+" sign does not appear at the beginning of the polynomial; if the coefficient of the polynomial of degree n is negative, the polynomial begins with the "-" sign.

4.  For items that are not of the highest degree, use "+" or "-" to connect this item with the previous item, indicating that the coefficient of this item is positive or negative, respectively. The item is followed by a positive integer indicating the absolute value of the coefficient (if a term of degree greater than 0 has a coefficient of an absolute value of 1, there is no need to output 1). If the exponent of x is greater than 1, then the following exponent part is of the form "x^b^", where b is the exponent of x; If the exponent of x is 1, the following exponent part is of the form "x"; If the exponent of x is 0, then only output the coefficient.

    5\. In polynomials, the beginning and end of polynomials do not contain extra spaces.

**Input**

The input file contains 2 lines.

The first line has an integer, n, represents the degree of the polynomial in one variable.

The second line has n+1 integers, where the i^th^ integer represents the coefficient of the n-i+1 term, and every two integers are separated by a space.

**Output**

The output file contains 1 line and outputs polynomials in the format described in the problem.

**Sample Input 1**

5

100 -1 1 -3 0 10

**Sample Output 1**

100x\^5-x\^4+x\^3-3x\^2+10

**Sample Input 2**

3

-50 0 0 1

**Sample Output 2**

-50x\^3+1

**Hint**

For 100% of the data, 0 ≤ n ≤ 100, -100 ≤ the coefficient ≤ 100.
