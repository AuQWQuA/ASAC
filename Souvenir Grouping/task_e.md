**Souvenir Grouping**

**Problem description**

New Year's Day is coming, the school student union let Lele be responsible for the New Year party souvenir distribution work. In order to make the value of the souvenirs obtained by the students attending the party relatively balanced, he should group the souvenirs according to the price, but each group can only include two souvenirs at most, and the sum of the prices of each group of souvenirs can not exceed a given integer. To ensure that all the souvenirs are distributed in as short a time as possible, Lele wants to keep the number of groups to a minimum.

Your task is to write a program to find the minimum number of groups among all the grouping schemes and outputs the minimum number of groups.

**Input**

The input file contains n+2 lines:

Line 1 includes an integer w, which is the upper bound on the sum of the souvenir prices for each group.

Line 2 is an integer n, which represents the total number of souvenirs purchased.

Lines 3 to n+2 each contain a positive integer P~i~ representing the price of the corresponding souvenir.

**Output**

The output file has only one integer that is the minimum number of groups.

**Sample Input**

100

9

90

20

20

30

50

60

70

80

90

**Sample Output**

6

**Hint**

50% of the data meet: 1 ≤ n ≤ 15.

100% of the data meet: 1 ≤ n ≤ 3×10^4^, 80 ≤ w ≤ 200, 5 ≤ P~i~ ≤ w.
