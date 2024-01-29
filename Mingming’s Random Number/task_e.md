**Mingming's Random Number**

**Problem description**

Mingming wanted to invite some students to do a questionnaire survey in school. For the objectivity of the experiment, he first used a computer to generate N random integers between 1 and 1000 (N ≤ 100). For the repeated numbers, only one was kept, and the rest of the same numbers were removed, different numbers correspond to different student numbers. Then sort these numbers from the smallest to the largest and find the students according to the order to do the survey. Please assist Mingming to complete the "deduplication" and "sorting" work.

**Input**

The input file has two lines. The first line contains a positive integer, which represents the number of generated random numbers N.

The second line has N positive integers separated by spaces, which are the generated random numbers.

**Output**

The output file also has two lines, the first line contains a positive integer M, which represents the number of different random numbers.

The second line has M positive integers separated by spaces, which are different random numbers ordered from small to large.

Sample Input

10

20 40 32 67 40 20 89 300 400 15

Sample Output

8

15 20 32 40 67 89 300 400
