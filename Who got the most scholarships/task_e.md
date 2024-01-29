**Who got the most scholarships**

**Problem description**

It is the custom of a school to award scholarships after the final examination of each semester. There are five types of scholarships awarded under different conditions:

1.  Academician Scholarship, RMB 8000 for each student whose final average score is higher than 80 (\>80), and has published one or more papers during the semester;

2.  May 4th Scholarship, RMB 4000 for each student whose final average score is higher than 85 (\>85), and class evaluation score is higher than 80 (\>80);

3.  Outstanding Academic Results Scholarship, RMB 2000 for each student whose final average score is higher than 90 (\>90);

4.  Western Scholarship, RMB 1000 per student, available to students from western provinces whose final average score is higher than 85 (\>85);

5.  Class Contribution Scholarship, RMB 850 for each student leader whose class evaluation score is higher than 80 (\>80);

Anyone who meets the criteria can win a prize, there is no limit to the number of winners per scholarship, and each student can be awarded multiple scholarships at the same time. For example, Yao Lin's average final score is 87 points, class evaluation score is 82 points, and he is also a student leader, then he can win the May 4th Scholarship and Class Contribution Scholarship at the same time, the total amount of scholarships is RMB 4850.

Now, given the data for a number of students, please calculate which students have received the highest total amount of scholarships (assuming that there are always students who meet the requirements for the scholarship).

**Input**

The first line of the input file is an integer N, representing the total number of students.

For the next N lines, each line is one student's data. From left to right: the student's name, final average score, class evaluation score, whether he/she is student leaders, whether he/she is from western provinces, and the number of papers he/she published. The name is a string of no more than 20 English letters without spaces; the final average score and class evaluation score are integers between 0 and 100 (including 0 and 100); whether the student is a student leader and whether the student is from western province are respectively represented by a character, Y indicates yes, N indicates no; the number of published papers is an integer from 0 to 10 (including 0 and 10). Each two contiguous data items are separated by a space.

**Output**

The output file contains three lines.

-   The first line is the name of the student who received the highest total amount of scholarships.

-   The second line is the total amount of scholarships that student received. If two or more students receive the most scholarships, output the name of the student whose name appears earliest in the input file.

-   The third line is the total amount of scholarships awarded to these N students.

**Sample Input**

4

YaoLin 87 82 Y N 0

ChenRuiyi 88 78 N Y 1

LiXin 92 88 N N 0

ZhangQin 83 87 Y N 1

**Sample Output**

ChenRuiyi

9000

28700

**Hint**

**\[Data Range\]**

For 100% of the data, 1 ≤ N ≤ 100.
