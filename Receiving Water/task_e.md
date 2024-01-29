**Receiving Water**

**Problem Description**

There is a water room in the school. There are a total of m faucets in the water room for students to open to get water. Each faucet has the same amount of water per second, which is 1.

Now there are n students ready to get water, and their initial order of receiving water has been determined. Number these students in the order of receiving water from 1 to n, and the amount of water that student i gets is w~i~. At the beginning of receiving water, students from 1 to m each occupy a faucet and turn on the faucet to receive water at the same time. When one of the students j has completed the water receiving requirement w~j~, the next student k waiting in line to receive water immediately takes over from the place of student j and starts to receive water. This substitution process is completed instantly, and there is no waste of water. That is, when student j finishes receiving water at the end of the x second, then student k starts receiving water immediately at the x+1 second. If the current number of people receiving water n is less than m, only n faucets will supply water, and the other m-n faucets will be closed. 

Now give the amount of water received by n students, and ask how many seconds it takes for all the students to receive the water according to the above rules.

**Input**

In the first line, there are two integers n and m, separated by a space, respectively indicating the number of people receiving water and the number of faucets.

In the second line, there are n integers w~1~, w~2~, \..., w~n~, separated by a space between every two integers, wi represents the amount of water received by student i.

**\[Constraints\]**

1 ≤ n ≤ 10000, 1 ≤ m ≤ 100, and m≤ n;

1 ≤ w~i~ ≤ 100.

**Output**

The output is only one line, with 1 integer, which represents the total time required for receiving water.

**Sample Input**

5 3

4 4 1 2 1

**Sample Output**

4

**Hint**

**\[Description of sample input and output 1\] **

In the 1st second, 3 people receive water. At the end of the 1st second, the amount of water received by students 1, 2, and 3 is 1. And as student 3 finishes receiving water, student 4 takes over from student 3 and starts receiving water. 

In the 2nd second, 3 people receive water. At the end of the 2nd second, the amount of water received by students 1 and 2 is 2, and the amount of water received by students 4 is 1. 

In the 3rd second, 3 people receive water. At the end of the 3rd second, the amount of water received by students 1 and 2 is 3, and the amount of water received by students 4 is 2. As student 4 finishes receiving water, student 5 takes over from student 4 and starts receiving water. 

In the 4th second, 3 people receive water. At the end of the 4th second, the amount of water received by students 1 and 2 is 4, and the amount of water received by students 5 is 1. When students 1, 2, and 5 finish receiving water, all students have completed receiving water. 

The total water retention time is 4 seconds. 

**Sample Input 2**

84 23

23 71 87 32 70 93 80 76

**Sample Output 2**

163
