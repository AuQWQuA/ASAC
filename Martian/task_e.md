**Martian**

**Problem Description**

Humans finally landed on the land of Mars and met the mysterious Martians. Neither humans nor Martians can understand each other's language, but our scientists have developed a way to communicate digitally. The way this communication works is that, first, the Martians tell the human scientists a very large number. After the scientist deciphers the meaning of the number, he adds a very small number to the large number and tells the Martians the result as the humans' answer.

The Martians had a very simple way to represent numbers \-- by snapping their fingers. Martians only have one hand, but it has thousands of fingers, numbered 1,2,3 in a row\...\... Any two fingers of a Martian can be swapped at will, and that's how they count.

A Martian uses a human hand to demonstrate how to count with fingers. If the five fingers, thumb, index finger, middle finger, ring finger and little finger numbers for 1, 2, 3, 4 and 5, respectively. When they are in normal order, the 5 digits in 12345 is formed; when you exchange the order of the ring finger and little finger, the 5 digits in 12354 is formed; when you reverse the order of your five fingers, the 5 digits in 54321 is formed. Of all the 120 five-digit numbers that can be formed, 12345 is the smallest, representing 1; 12354 is the second smallest, it means 2; 54321 is the largest, it means 120. The table below shows the 6 three-digit numbers that can be formed with only three fingers and the numbers they represent:

  ---------------- ------------------------
  Ternary Number   The Number Represented
  123              1
  132              2
  213              3
  231              4
  312              5
  321              6
  ---------------- ------------------------

Now you have the honor of being the first earthling to communicate with a Martian. A Martian will show you his finger, and the scientist will tell you the tiny numbers to add. Your task is to add the Martian finger number to the number the scientist tells you, and change the order of the Martian fingers based on the result. The input data ensures that the result is within the range of a Martian's fingers.

**Input**

The input file consists of three lines.

The first line has a positive integer N, representing the number of Martian fingers (1≤N≤10000).

The second line contains a positive integer M, representing the small integer to be added (1≤M≤100).

The next line is a permutation of N integers from 1 to N, separated by spaces, indicating the order in which a Martian's fingers are placed.

**Output**

The output file has only one line, which contains N integers representing the changed order of the Martian's fingers. Every two contiguous numbers must be separated by a space. No extra space is allowed.

**Sample Input**

5

3

1 2 3 4 5

**Sample Output**

1 2 4 5 3

**Data Size**

For 30% of the data, N ≤ 15.

For 60% of the data, N ≤ 50.

For all of the data, N ≤ 10000.

**Note:**

1.  Binary tree: a binary tree is a finite set of nodes, which is either empty or consists of a root node and two disjoint binary trees. These two disjoint binary trees are called the left and right subtrees of the root.

2.  Post-order traversal: Post-order traversal is a depth-first traversal of binary trees. Its recursive definition is that the left subtree is traversed first, then the right subtree is traversed, and finally the root is accessed.
