**Shuffle**

**Problem Description**

N students are going to take the shuttle bus from The High School Affiliated to Renmin University to Renmin University. The i^th^ student will be waiting for the bus in the ti^th^ minute. Only one shuttle bus is in operation, but the capacity of the shuttle bus can be regarded as infinite. The shuttle bus starts from The High School Affiliated to Renmin University, takes students on board to Renmin University, and then back to The High School Affiliated to Renmin University (to pick up other students). Such a round trip takes a total of m minutes (the time it takes for students to get on and off the shuttle is ignored). The shuttle will take all the students to Renmin University.

Kaikai wonders that, if he can arrange the departure time of the shuttle at will, then what is the minimum total waiting time for these students?

Note: The shuttle bus can leave immediately after returning to The High School Affiliated to Renmin University.

**Input**

The first line contains two positive integers n (n≤500) and m (m≤100), which respectively represent the number of students waiting for the bus and the time of a shuttle bus round trip.

The second line contains n positive integers. Every two adjacent numbers are separated by a space. The i^th^ non-negative integer t~i~ (0 ≤ ti ≤ 4×10^6^) represents the time when the i^th^ student arrives at the station.

**Output**

There is a line containing an integer, representing the minimum total sum of the waiting time of all these students (unit: minute).

**Sample Input**

5 1

3 4 4 3 5

**Sample Output**

0

**Hint**

Students 1 and 4 start to wait for the shuttle at the 3^rd^ minute. Then they wait for 0 minutes and take the shuttle to leave at the 3^rd^ minute. The shuttle returned to The High School Affiliated to Renmin University in the 4^th^ minute.

Students 2 and 3 start to wait for the shuttle at the 4^th^ minute. Then they wait for 0 minutes and take the shuttle to leave at the 4^th^ minute. The shuttle returned to The High School Affiliated to Renmin University in the 5^th^ minute.

Student 5 starts to wait for the shuttle at the 5^th^ minute. Then student 5 waits for 0 minutes and takes the shuttle to leave at the 5th minute. Since then, all the students have been sent to Renmin University. The total waiting time is 0.

**Sample Input 2**

5 5\
11 13 1 5 5

**Sample Output 2**

4

**Explanation of Sample 2:**

Student 3 starts to wait for the shuttle at the 1^st^ minute, waits for 0 minutes, and takes the ferry at the 1^st^ minute. The shuttle returned to The High School Affiliated to Renmin University in the 6^th^ minute.

Students 4 and 5 start to wait for the shuttle in the 5th minute, wait for 1 minute and take the shuttle in the 6^th^ minute. The shuttle returned to The High School Affiliated to Renmin University in the 11^th^ minute.

Student 1 starts to wait for the bus at the 11^th^ minute and waits for 2 minutes. Student 2 starts to wait for the bus in the 13^th^ minute and waits for 0 minutes. They leave at the 13th minute. Since then, all the students have been sent to Renmin University. The total waiting time is 4.

It can be proved that there is no scheme with a total waiting time less than 4.

**\[Data Size and Constraints\]**

For 10% of the data, n ≤ 10, m=1, 0 ≤ t~i~ ≤ 100.

For 30% of the data, n ≤ 20, m≤2, 0 ≤ t~i~ ≤100.

For 50% of the data, n ≤ 500, m ≤ 100, 0 ≤ t~i~ ≤ 10^4^.

For another 20% of the data, n ≤ 500, m ≤ 10, 0 ≤ t~i~ ≤ 4×10^6^.

For 100% of the data, n ≤ 500, m ≤ 100, 0 ≤ t~i~ ≤ 4×10^6^.
