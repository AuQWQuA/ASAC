**King Game**

**Problem Description**

On the National Day of Country H, the King invited n of his ministers to play a prize game. First, he asked each minister to write an integer on his left hand and an integer on his right hand. The king himself also wrote an integer on his left hand and an integer on his right hand. Then he made the n ministers line up in a row, with the king at the head of the line. After they line up, all the ministers receive the king's reward of a number of gold coins, the number of coins each minister receives is by dividing the product of the numbers on the left hand of all the people in front of him by the number on his right hand, rounded down.

The king did not want any of his ministers to be rewarded too much, so he asked you to help him rearrange the order of the lines so that the minister who received the most was rewarded as little as possible. Notice that the king is always at the head of the line.

**Input**

The first line contains an integer n for the number of ministers.

The second line contains two integers a and b, separated by a space, representing the integers on the king's left and right hands, respectively.

For the next n lines, each containing two integers a and b, separated by a space, represent the integers on the left and right hands of each minister, respectively.

**Output**

An integer indicating the number of gold coins earned by the most rewarded minister in the rearranged queue.

**Sample Input**

3

1 1

2 3

7 4

4 6

**Sample Output**

2

**Hint**

**\[Explanation of Sample\]**

If in the order of 1, 2, and 3. The minister with the most reward will get 2 gold coins.

If in the order of 1, 3, and 2. The minister with the most reward will get 2 gold coins.

If in the order of 2, 1, and 3. The minister with the most reward will receive 2 gold coins;

If in the order of 2, 3, and 1. The minister with the most reward will get 9 gold coins.

If in the order of 3, 1, and 2. The minister with the most reward will get 2 gold coins.

If in the order of 3, 2, and 1. The minister with the most reward will get 9 gold coins.

Therefore, the minister with the most reward gets at least 2 gold coins, and the answer outputs 2.

**\[Data range\]**

For 20% of the data, 1≤ n≤ 10, 0 \< a,b \< 8;

For 40% of the data, 1≤ n≤20, 0 \< a,b \< 8;

For 60% of the data, 1≤ n≤100;

For 60% of the data, make sure the answer is no more than 10^9^;

For 100% of the data, 1 ≤ n ≤ 1000, 0 \< a,b \< 10000.
