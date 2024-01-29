**The Librarian**

**Problem Description**

Each book in the library has a book code, which is a positive integer and can be used to quickly retrieve books. Each reader who borrows books has a requirement code, which is also a positive integer. If a book's book code ends in the reader's requirement code, then this book is what the reader needs. D has just become the librarian of the library. She knows the book codes of all the books in the library. She asks you to help her write a program that for every reader, find the book with the smallest code among the books he needs, and if there is no book he needs, print -1.

**Input**

The first line contains two positive integers, n and q, separated by a space, representing the number of books in the library and the number of readers.

The next n lines, each containing a positive integer, represent the book code of a book in the library.

The next q lines each contain two positive integers, separated by a space. The first positive integer represents the length of the reader's requirement code, and the second positive integer represents the reader's requirement code.

**Output**

There are q lines, each containing an integer. If the books required by the i^th^ reader exist, find the one with the smallest book code among all the books the i^th^ reader needs, and print that code on line i. Otherwise, print -1.

**Sample Input**

5 5

2123

1123

23

24

24

2 23

3 123

3 124

2 12

2 12

**Sample Output**

23

1123

-1

-1

-1

**Hint**

For 20% of the data, 1 ≤ n ≤ 2.

For another 20% of the data, q=1.

For another 20% of the data, the length of the requirement code is 1 for all readers.

For another 20% of the data, all the book codes are given in order from smallest to largest.

For 100% of the data, 1 ≤ n ≤ 1000, 1 ≤ q ≤ 1000, all book codes and requirement codes do not exceed 10,000,000.
