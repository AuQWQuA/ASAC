**The Game of Ball Passing**

**Problem description**

In PE class, Xiaoman's teacher often takes the students to play games together. This time, the teacher leads the students to play the game of ball passing.

Here's how the game works: n students stand in a circle, one of the students holding a ball, when the teacher blow his whistle, the passing starts, each student can pass the ball to one of two adjacent students (either left or right), when the teacher blow his whistle again, the ball passing stop. At this time, the one with the ball that didn't pass to others is the loser, and he/she need to give a performance.

The clever Xiaoman raises an interesting question: how many different ways can a ball be passed from his hand and returned to himself after m passes? Two methods of passing are considered different methods if and only if the sequence of the students receiving the ball is different in the two methods. For example, there are three students No.1, No.2, and No.3, and assume that Xiaoman is No.1. The ball can be passed three times and returned to Xiaoman in the way of 1-\>2-\>3-\>1 or 1-\>3-\>2-\>1, a total of two ways.

**Input**

The input file is a single line containing two integers n, m separated by a space (3 ≤ n ≤ 30, 1 ≤ m ≤ 30).

**Output**

The output is an integer indicating the number of methods that match the question.

**Sample Input**

3 3

**Sample Output**

2

**Hint**

40% of the data meet: 3 ≤ n ≤ 30,1 ≤ m ≤ 20

100% of the data meet: 3 ≤ n ≤ 30, 1 ≤ m ≤ 30
