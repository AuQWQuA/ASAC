**The smart quality supervisor**

**Problem Description**

'T' is a quality supervisor who was recently tasked with inspecting the quality of a batch of minerals. There are n ores in the batch, numbered from 1 to n, each with its weight w~i~ and value v~i~. The process for inspecting minerals is as follows:

1\. Given m intervals \[l~i~, r~i~\];

2\. Select a parameter W;

3\. For an interval \[l~i~,r~i~\], calculate the test value y~i~ of the ore on this interval:

j is the number of the ore.

The inspection result Y of this batch of minerals is the sum of the inspection values of each interval. Namely:

If the inspection result of this batch of minerals is too different from the given standard value S, another batch of minerals needs to be inspected. T doesn't want to spend time testing another group of minerals, so he wants to make the inspection result as close to the standard values as possible by adjusting the value of the parameter W. That is, to make \|S-y\| minimum. Would you please help to calculate the minimum value?

**Input**

The first line contains three integers n, m, and s representing the number of ores, the number of intervals, and the standard value respectively.

For the next n lines, there are two integers per line, separated by a space. Line i+1 represents the weight w~i~ and value v~i~ of ore i.

The next m lines represent intervals. There are two integers per line, separated by a space, and the i +n+1 line represents the two endpoints l~i~ and r~i~ of the interval \[l~i~, r~i~\]. Note: Different intervals may coincide or overlap with each other.

**Output**

5 3 15

1 5

2 5

3 5

4 5

5 5

1 5

2 4

3 3

**Sample Output**

10

**Hint**

**\[Explanation of Sample\]**

When W is selected as 4, the test values of the three intervals are 20, 5, and 0 respectively, and the test result of this batch of minerals is 25. The minimum difference with the standard value S now is 10.

**\[Data Range\]**

For 10% of the data, 1≤n, m≤10;

For 30% of the data, 1≤n, m≤500;

For 50% of the data, 1≤n, m≤5,000;

For 70% of the data, 1≤n, m≤10,000;

For 100% of the data, 1≤n, m≤200,000, 0 \< w~i~, v~i~≤10^6^, 0 \< s≤10^12^, and 1 ≤ l~i~ ≤ r~i~ ≤ n.
