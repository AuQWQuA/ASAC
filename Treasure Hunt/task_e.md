**Treasure Hunt**

**Problem Description**

Legend has it that there are tantalizing treasures hidden on the top floor of the very distant treasure building. Xiao Ming finally found the legendary treasure building after all kinds of hardships. A wooden board was erected at the door of the treasure building, with a few large characters written on it: treasure hunting instructions. The contents of the instruction are as follows:

There are N+1 floors in the treasure building, and there is a room on the top floor with treasure hidden in it. In addition to the top floor, the treasure building has N floors with M rooms on each floor. The M rooms are enclosed in a circle and numbered counterclockwise as 0,\..., M-1. Some of the rooms have stairs leading to the upper floor, and the design of the stairs on each floor may be different. There is a sign in each room, and there is a number x on the sign, which means that starting from this room, select the x^th^ room with stairs in a counterclockwise direction (assuming the number of the x^th^ room is k), and then go upstairs from this room, one can arrive at room k on the upper floor. For example, if the sign of the current room says 2, try to go counterclockwise to find the second room with stairs, and go upstairs from that room. If the current room itself has stairs leading to the upper floor, this room will be the first room with stairs. 

At the end of the treasure hunt instruction, the following words are written in large red font: "Treasure hunt instructions", sum up all the numbers which help you find the rooms that lead to the upper floors on each floor (that is, the numbers on the signs in the first room you enter on each floor), and the number you get is the key to open the treasure. \
Please help Xiao Ming figure out the key to open the treasure.

**Input**

The first line contains two integers N and M, separated by a space. N means the treasure building has N floors excluding the top floor, and M means there are M rooms on each floor except the top floor.       

For the next N\*M lines, each line has two integers, separated by a space. Each line describes the situation in a room, where the (i-1)\*M+j line represents the situation in the j-1 room on the i^th^ floor (i=1, 2, \..., N; j=1, 2, \..., M). The first integer indicates whether the room has stairs leading to the upper floor (0 means no, 1 means yes), and the second integer indicates the number on the sign in this room. Note that the room you reach on the upper floor from the stairs of room j must also be room j on that floor. \
The last line contains an integer that indicates the number of the room that Xiao Ming entered on the bottom floor of the treasure building when starting the treasure hunt (note: the room number starts from 0).

**\[Constraints\] **

For 50% of the data, 0 \< N ≤ 1000, 0 \< x ≤ 10000; \
for 100% of the data, 0 \< N ≤ 10000, 0 \< M ≤ 100, 0 \< x ≤ 1,000,000;

**Output**

The output contains only one line which is an integer, representing the key that can open the treasure. This number may be very large. Please output the result of modulo 20123.

**Sample Input**

2 3 

1 2 \
0 3 \
1 4 \
0 1 \
1 5 \
1 2 \
1

**Sample Output**

5

**Hint**

**\[Explanation for Sample Input and Output\]**

First floor: \
Room 0, there is a staircase leading to the upper floor, the number on the sign is 2; \
Room 1, there is no staircase leading to the upper floor, the number on the sign is 3; \
Room 2, there is a staircase leading to the upper floor, the number on the sign is 4;

Second floor: \
Room 0, there is no staircase leading to the upper floor, the number on the sign is 1; \
Room 1, there is a staircase leading to the upper floor, the number on the sign is 5; \
Room 2, there is a staircase leading to the upper floor, the number on the sign is 2; 

Xiao Ming first enters room 1 on the first floor (the ground floor) and remembers the number on the sign as 3. And then he goes counterclockwise from this room and chooses the 3^rd^ room with stairs which is room 2. After going upstairs, Xiao Ming will reach room 2 on the second floor. He will notice the number on the sign as 2. Because the current room itself has stairs leading to the upper floor, this room should be counted as the first room with stairs. Therefore, at this time, choose the second room with stairs in the counterclockwise direction, that is, room 1. Then he will go up the stairs in room 1 to enter the top floor. Now, add up the numbers on the signs noted above, that is, 3+2=5, so the key to open the treasure is 5.
