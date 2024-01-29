**The Salesman**

**Problem Description**

Aming is a salesman who has been sent to Screw Street to promote his company's products. Screw Street is a dead-end street with the same exit as the entrance, with walls on one side of the street and households on the other. There are a total of N households in Screw Street, and the distance of Household ii to the entrance is Si meters. Since there can be more than one household in the same house, there may be more than one household at an equal distance from the entrance. Aming will enter through the entrance, sell his products to X homes on Screw Street in turn, and then retrace his steps.

Aming accumulates 1 point of fatigue for every 1 meter he walks, and selling products to Household ii accumulates Ai points of fatigue. Aming is a workaholic and wants to know, for different X, what is the maximum number of fatigue points he can accumulate without taking extra paths.

**Input**

The first line has a positive integer N representing the number of Screw Street households.

The next line has N positive integers. The i^th^ integer Si represents the distance from Household ii to the entrance. Guaranteed that S1≤S2≤...≤Sn\<10^8^.

The next line has N positive integers. The i^th^ integer Ai represents the fatigue value that would accumulate by selling the product to the i^th^ household. Guaranteed that Ai\<1000.

**Output**

There are N lines, each containing a positive integer, and the integer in the i^th^ row represents the fatigue value accumulated by Aming at most when X= i.

**Sample Input**

5

1 2 3 4 5

1 2 3 4 5

**Sample Output**

15

19

22

24

25

**Hint**

**\[Explanation of sample 1\]**

X=1: Selling to household 5, the fatigue value of round-trip walking is 5+5, the fatigue value of selling is 5, and the total fatigue value is 15.

X=2: Selling to households 4, 5, the fatigue value of round-trip walking is 5+5, the fatigue value of selling is 4+5, and the total fatigue value is 5+5+4+5=19.

X=3: Selling to households 3, 4, and 5, the fatigue value of round-trip walking is 5+5, the fatigue value of selling is 3+4+5, and the total fatigue value is 5+5+3+4+5=22.

X=4: Selling to households 2, 3, 4, 5, the fatigue value of round-trip walking is 5+5, the fatigue value of selling is 2+3+4+5, and the total fatigue value is 5+5+2+3+4+5=24.

X=5: Selling to households 1, 2, 3, 4, 5, the fatigue value of round-trip walking is 5+5, the fatigue value of selling is 1+2+3+4+5, and the total fatigue value is 5+5+1+2+3+4+5=25.

**Sample Input 2**

5\
1 2 2 4 5\
5 4 3 4 1

**Sample Output 2**

12\
17\
21\
24\
27

**\[Explanation of sample 2\]**

X=1: Selling to household 4, the fatigue value of round-trip walking is 4+4, the fatigue value of selling is 4, and the total fatigue value is 4+4+4=12.

X=2: Selling to households 1, 4, the fatigue value of round-trip walking is 4+4, the fatigue value of selling is 5+4, and the total fatigue value is 4+4+5+4=17.

X=3: Selling to households 1, 2, and 4, the fatigue value of round-trip walking is 4+4, the fatigue value of selling is 5+4+4, and the total fatigue value is 4+4+5+4+4=21.

X=4: Selling to households 1, 2, 3, 4, the fatigue value of round-trip walking is 4+4, the fatigue value of selling is 5+4+3+4, and the total fatigue value is 4+4+5+4+3+4=24. Or sell to households 1,2,4,5, with a fatigue value of 5+5 for round-trip walking,5 +4+4+1 for selling, and 5+5+5+4+4+1=24 for total fatigue.

X=5: Selling to households 1, 2, 3, 4, 5, the fatigue value of round-trip walking is 5+5, the fatigue value of selling is 5+4+3+4+1, and the total fatigue value is 5+5+5+4+3+4+1=27.

**\[Constraints\]**

For 20% of the data, 1 ≤ N ≤ 20;

For 40% of the data, 1 ≤ N ≤ 100;

For 60% of the data, 1 ≤ N ≤ 1000;

For 100% of the data, 1 ≤ N ≤ 100000.
