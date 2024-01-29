**Solve the Equation**

**Problem Description**

Given the polynomial equation:

a~0~ + a~1~x + a~2~x^2^ + \... + a~n~x^n^ = 0

Find an integer solution to this equation in \[1,m\] (n and m are both positive integers).

**Input**

Enter a total of N + 2 lines.

The first line contains 2 integers, n and m, separated by a space.

The next n+1 lines contain one integer each. The integers are a~0~, a~1~, a~2~ \... a~n~, respectively.

**Output**

The first line outputs the number of integer solutions to the equation within \[1, m\].

Next, there is one integer per line, each representing one integer solution of the equation within \[1, m\] in ascending order.

**Sample Input 1**

2 10

1

-2

1

**Sample Output 1**

1

1

**Sample Input 2**

2 10

2

-3

1

**Sample Output 2**

2

1

2

**Sample Input 3**

2 10

1

3

2

**Sample Output 3**

0

**Hint**

For 30% of the data: 0 \< n ≤ 2, \|a~i~\| ≤ 100, a~n~ ≠ 0, m\<100.

For 50% of the data: 0 \< n ≤ 100, \|a~i~\| ≤ 10^100^, a~n~ ≠ 0, m\<100.

For 70% of the data: 0 \< n ≤ 100, \|a~i~\| ≤ 10^10000^, a~n~ ≠ 0, m\<10^4^.

For 100% of the data: 0 \< n ≤ 100, \|a~i~\| ≤ 10^10000^, a~n~ ≠ 0, m\<10^6^.
