**Campfire Party**

**Problem description**

Jiajia has just entered high school. In the military training, due to her hard-working, Jiajia got the appreciation of the instructor, became a "little instructor". At the end of the military training, that night, Jiajia was ordered to organize the students to have a campfire party. There are n students numbered from 1 to n. At the beginning, students follow the order of 1,2\... , n to sit in a circle, but in fact everyone has two classmates that he/she would most like to be next to. To adjust the order of the students to form a new circle to satisfy the wishes of the students became a big problem in front of Jiajia.

Jiajia can command the students, each in the form of the following:

(b~1~, b~2~,\... b~m-1~, b~m~)

Here the value of m is determined by Jiajia, and the value of m can be different each time the command is given. What this command does is move the position of these m students with the number b~1~, b~2~,\... b~m-1~, b~m~. Move b~1~ to the position of b~2~, b~2~ to the position of b~3~\... and b~m~ to the position of b~1~. There are cost to execute each command. We assume that if a command moves the position of m people, the cost of the command is m. We need Jiajia to satisfy the wishes of the students with the least total cost. Can you help Jiajia?

**Input**

The first line of the input file is an integer n, indicating that there are n students.

Each of the following n lines contains two different positive integers, separated by a space, which respectively represent the number of the two adjacent students that student 1 wants most, the number of the two adjacent students that student 2 wants most\..., the number of the two adjacent students that n wants most.

**Output**

The output file contains one integer for the minimum total cost. If no matter how Jiajia adjust the positions, it cannot meet the wishes of every student, output -1.

**Sample Input**

4

3 4

4 3

1 2

1 2

**Sample Output**

2

**Data Size**

For 30% of the data, n ≤ 1000;

For 100% of the data, 3 ≤ n ≤ 50000.
