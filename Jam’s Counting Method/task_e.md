**Jam's Counting Method**

**Problem description**

Jam is an unconventional weirdo. Instead of using Arabic numerals, he uses lowercase English letters to count, which he thought would make the world more interesting.

In his counting method, each number has the same number of digits (using the same number of letters), and according to the original order of the English letters, the letter in the front is smaller than the letter follow it. We call such "numbers" as Jam Numbers. In Jam Numbers, each letter is distinct and strictly increasing from left to right. Each time, Jam also specifies a range of letters to use, for example, from 2 to 10, indicating that only b, c, d, e, f, g, h, i, j can be used. If let the number of digits be 5, then the following number after the Jam Number "bdfij" should be "bdghi". (If we use U and V to denote the Jam Numbers "bdfij" and "bdghi", then U \< V, and there is no Jam Number P can make U \< P \< V.)

Your task is: For a Jam Number read from the file, output the following five Jam Numbers in order, and if there are not that many Jam Numbers, then output as many as there are.

**Input**

The input file has two lines.

The first line contains three positive integers s, t, w, separated by spaces.

(Where s is the serial number of the smallest letter used, and t is the serial number of the largest letter used. w is the number of digits, and these three numbers meet the following requirements: 1 ≤ s \< t ≤ 26, 2 ≤ w ≤ t-s).

The second line is a string with w lowercase letters, which is a Jam Number that meets the requirement.

All the data given are correct and need not be verified.

**Output**

The output file has a maximum of 5 lines, which are the five Jam Numbers follow after the Jam Number entered, and if there are not that many Jam Numbers, the output will be as many as there are. Each line only output one Jam Number, a string of w lowercase letters, no extra spaces.

**Sample Input**

2 10 5

bdfij

**Sample Output**

bdghi

bdghj

bdgij

bdhij

befgh
