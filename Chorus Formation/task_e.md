**Chorus Formation**

**Problem description**

There are n students standing in a row. The music teacher will ask (n-k) of them to step out and the remaining k students will form a chorus.

Chorus formation refers to such a formation: From left to right, suppose k students are numbered as 1, 2\... from left to right, their heights are t~1~, t~2~\..., t~k~ respectively, and their height meets t~1~\<t~2~\<...\<t~i,~ t~i~\>t~i+1~\>...\>t~k~(1≤ i ≤k).

Your task is, given the height of all the n students, calculate the minimum number of students needed to come out of the line, so that the rest of the students can form a chorus formation.

**Input**

There are two lines in total.

The first line of the input file is an integer N (2≤ n ≤100), indicating the total number of students.

The second line has n integers, separated by spaces, the i^th^ integer t~i~ (130≤ t~i~ ≤230) is the height (cm) of the i^th^ student.

**Output**

The output file contains a line, which only has one integer, that is, the minimum number of students who need to be out of the column.

**Sample Input**

8

186 186 150 200 160 130 197 220

**Sample Output**

4

**Data Size**

For 50% of data, make sure that n≤20;

For all data, make sure that n≤100.
