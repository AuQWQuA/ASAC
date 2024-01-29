**Counting Numbers**

**Problem description**

In a scientific research survey, n natural numbers were obtained, and each number was no more than 1,500,000,000 (1.5 × 10^9^). It is known that there are no more than 10,000 different numbers. Now we need to count the number of occurrences of these natural numbers and output the counting results in the ascending order of natural numbers.

**Input**

The input file contains n+1 lines.

The first line is an integer n, representing the number of natural numbers.

Line 2 to line n+1 each have a natural number in the line.

**Output**

The output file contains m lines (m is the number of different numbers in n natural numbers), and the output is in the ascending order of natural numbers.

Each line outputs two integers, which are the natural number and the number of occurrences of that number, separated by a space.

**Sample Input**

8

2

4

2

4

5

100

2

100

**Sample Output**

2 3

4 2

5 1

100 2

**Hint**

40% of the data meet: 1 ≤ n ≤ 1000

80% of the data meet: 1 ≤ n ≤ 50000

100% of the data meet: 1 ≤ n ≤ 200000, each number is not more than 1,500,000,000 (1.5 × 10^9^)
