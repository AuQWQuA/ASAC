**Delimit the Minimum Passing Score**

**Problem description**

The selection of volunteers for the World Expo is in full swing in city A. In order to select the most suitable talents, city A has conducted a written test for all the candidates who have applied for the volunteering. Only those who have reached the minimum passing score can enter the interview. The delimitation of the minimum passing score is based on 150% of the planned enrollment number, that is, if the plan is to recruit m volunteers, the score line for the interview will be the score of the candidate ranked m × 150% (rounded down), and the final candidates who will enter the interview will be all the candidates whose written test scores are not lower than the minimum passing score for the interview.

Now please write a program to delimit the minimum passing score, and for candidates who make into the interview, output their registration numbers and their scores of the written test.

**Input**

In the first line, two integers n, m (5 ≤ n ≤ 5000, 3 ≤ m ≤ n) are separated by a space, where n represents the total number of candidates who have signed up for the written test, and m represents the the planned enrollment number. The input data ensure that the result of m × 150% rounded down must be less than or equal to n.

From line 2 to line n+1, each line contains two integers separated by a space, which are the registration number of the candidate k (1000 ≤ k ≤ 9999) and the score of the written test of the candidate s (1 ≤ s ≤ 100). The data guarantees that the registration number of each candidate is different.

**Output**

In the first line, there are two integers, separated by a space, the first integer represents the minimum passing score for entering the interview; the second integer is the actual number of candidates who entered the interview.

Starting from the second line, each line contains two integers separated by a space, which respectively represent the registration number and written test score of the candidates who entered the interview. The output shall be based on the written test score from the highest to the lowest. If the scores are the same, the output shall be based on the registration number from the smallest to the largest.

**Sample Input**

6 3

1000 90

3239 88

2390 95

7231 84

1005 95

1001 88

**Sample Output**

88 5

1005 95

2390 95

1000 90

1001 88

3239 88

**Hint**

**\[Explanation of the Sample\]**

m × 150% = 3 × 150% = 4.5, rounded down to 4. The minimum passing score is 88 for 4 people to enter the interview. However, because of the repetition of the score 88, all the candidates with scores greater than or equal to 88 can enter the interview. Therefore, 5 people will enter the interview finally.
