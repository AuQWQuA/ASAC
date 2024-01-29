**Kat\'s doubts**

**Problem Description**

Kai has gold coins in two denominations. Both denominations are positive integers and prime to each other. There are an infinite number of each coin. There are some items he can't pay for exactly with just these two coins without change. Now Kai wants to know how much gold coins the most expensive item that cannot be accurately paid for cost. Note: The input data guarantees that there are items for which Kai cannot accurately pay.

**Input**

There are two positive integers a and b, separated by a space, representing the denomination of the gold coins of Kai.

**Output**

There is a positive integer N representing the value of the most expensive item that Kai cannot accurately pay for without change with the gold coins in his hand.

**Sample Input**

3 7

**Sample Output**

11

**Hint**

**\[Explanation of the Sample\]**

Kai has countless gold coins with denominations of 3 and 7 in his hands. He cannot accurately pay for items with values of 1, 2, 4, 5, 8, and 11 without change. The most expensive item is worth 11, and anything more expensive than 11 can be bought accurately, such as:

12 = 3 × 4 + 7 × 0;

13 = 3 × 2 + 7 × 1;

14 = 3 × 0 + 7 × 2;

15 = 3 × 5 + 7 × 0.

**\[Data range and convention\]**

For 30% of the data: 1 ≤ a, b ≤ 50.

For 60% of the data: 1 ≤ a, b ≤ 10^4^.

For 100% of the data: 1 ≤ a, b ≤ 10^9^.
