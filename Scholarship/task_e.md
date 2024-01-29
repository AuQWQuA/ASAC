**Scholarship**

**Problem description**

An elementary school recently received a donation and plans to give part of it as scholarship to the top five students with excellent academic performance. At the end of the semester, each student has the score of three subjects: Chinese, Math and English. Rank student's total score from highest to lowest, if two students have the same total score, then they will be sorted from the highest to the lowest by their Chinese score. If two students have the same total score and Chinese score, the student with the smaller student number will be ranked first. In this way, the ranking of each student is uniquely determined.

Task: First, calculate the total score according to the input scores of the three courses, then sort the scores according to the above rules, and finally output the student numbers and total score of the top five students in the ranking order. Note that in the top 5 students, each one's scholarship is not the same, therefore, you must strictly follow the above rules. For example, in a certain correct answer, if the first two lines of output data (each line outputs two numbers: student number, total score) are:

7 279

5 279

What these two rows of data mean is that the student numbers of the two students with the highest total score are No. 7 and No. 5, respectively. Both students scored a total of 279 (the total score is equal to the sum of the scores entered in Chinese, Math and English), but the student with the student number 7 scored higher in Chinese. If your top two output figures are:

5 279

7 279

it will be treated as an output error and no points will be scored.

**Input**

The input file contains n+1 lines.

The first line is a positive integer n (≤ 300), indicating the number of students from the school who participated in the selection.

From line 2 to line n+1, each line has three numbers separated by spaces, each number is between 0 and 100. The three numbers in line j represent the Chinese, Math and English scores of student j-1 in turn. Each student's student number is numbered from 1 to n in the input order (exactly the line number of the input data minus 1).

All the data given are correct and need not be checked.

**Output**

The output file has 5 lines, each line contains two positive integers separated by a space, which represents the student number of the top 5 students and the total score in turn.

**Sample Input 1**

6

90 67 80

87 66 91

78 89 91

88 99 77

67 89 64

78 89 98

**Sample Output 1**

6 265

4 264

3 258

2 244

1 237

**Sample Input 2**

8

80 89 89

88 98 78

90 67 80

87 66 91

78 89 91

88 99 77

67 89 64

78 89 98

**Sample Output 2**

8 265

2 264

6 264

1 258

5 258
