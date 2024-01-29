**Submatrix**

**Problem Description**

Given the following definition:

Submatrix: A new matrix formed by selecting the intersection positions of some rows and some columns from a matrix (keeping the relative order of rows and columns) is called a submatrix of the original matrix.

For example, in the left image below, select the elements at the intersection of rows 2 and 4 and columns 2, 4, and 5, and get a 2\*3 submatrix as shown in the right image.

| $9$                | $\color{#6a5acd}3$ | $3$                | $\color{#6a5acd}3$ | $\color{#6a5acd}9$ |
| :----------------- | :----------------- | :----------------- | :----------------- | :----------------- |
| $\color{#6a5acd}9$ | $\color{blue}4$    | $\color{#6a5acd}8$ | $\color{blue}7$    | $\color{blue}4$    |
| $1$                | $\color{#6a5acd}7$ | $4$                | $\color{#6a5acd}6$ | $\color{#6a5acd}6$ |
| $\color{#6a5acd}6$ | $\color{blue}8$    | $\color{#6a5acd}5$ | $\color{blue}6$    | $\color{blue}9$    |
| $7$                | $\color{#6a5acd}4$ | $5$                | $\color{#6a5acd}6$ | $\color{#6a5acd}1$ |

One of its submatrixes is:

| $4$  | $7$  | $4$  |
| :--- | :--- | :--- |
| $8$  | $6$  | $9$  |

Adjacent elements: An element in a matrix is adjacent to the four elements above, below, on its left, and on its right (if any).

The score of a matrix: The sum of the absolute values of the differences between each pair of adjacent elements in the matrix.

Task: Given a positive integer matrix with n rows and m columns, select a submatrix with r rows and c columns from the matrix such that the score of the submatrix is minimized, and output the score.

**Input**

The first line contains four integers n, m, r, and c, separated by a space between every two integers. The meanings of these integers are as described in the problem description.

The next n rows, each containing m integers separated by spaces, are used to represent that matrix with n rows and m columns in the problem description.

**Output**

The output consists of one row which contains an integer representing the minimum score of the submatrix that satisfies the problem description.

**Sample Input**

5 5 2 3

9 3 3 3 9

9 4 8 7 4

1 7 4 6 6

6 8 5 6 9

7 4 5 6 1

**Sample Output**

6

**Hint**

For 50% of the data, 1 ≤ n ≤ 12, 1 ≤ m ≤ 12, and every element in the matrix satisfies: 1 ≤ a\[i\]\[j\] ≤ 20;

For 100% of the data, 1 ≤ n ≤ 16, 1 ≤ m ≤ 16, and every element in the matrix satisfies: 1 ≤ a\[i\]\[j\] ≤ 1000, 1 ≤ r ≤ n, 1 ≤ c ≤ m.
