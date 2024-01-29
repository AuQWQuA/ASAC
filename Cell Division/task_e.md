**Cell Division**

**Problem description**

Dr. Hanks is a well-known expert in the field of BT (Bio-Tech). Now, he is preparing for a cell experiment: culturing cell samples.

Dr. Hanks now has N types of cells, numbered from 1 to N. A cell of type i can divide into S~i~ cells of the same kind in one second (S~i~ is a positive integer). Now he has to take a cell of one kind and put it in a culture dish, let it divide freely, and grow it. After a period of time, evenly divide all the cells in the culture dish into M test tubes to form M samples for the experiment. The number of Dr. Hanks' test tubes, M, is very large. The basic data types of ordinary computers can not store such a large value of M. Fortunately, M can always be expressed as m~1~ to the power of m~2~, that is, M = m~1~^m2^, where m~1~ and m~2~ are positive integers that can be stored by the basic data types.

Note that it's not allowed to divide individual cells throughout the experiment. For example, if there are 4 cells in a culture dish at some point, Dr. Hanks can divide them into two tubes, two in each, and begin the experiment. But if there are five cells in a culture dish, he could not divide them equally into two tubes. The doctor then has to wait a while for the cells to divide so that they could be divided equally, or switch to a different type of cells to culture.

To get the experiment started early, after selecting a type of cell to start the culture, Dr. Hanks will always stop the culture and start the experiment when the resulting cells are "just enough to be evenly divided into M tubes". Now he wants to know to choose which type of cells to culture so that the experiments can begin at the earliest.

**Input**

The first line has a positive integer N, representing the number of cell species.

The second line has two positive integers, m~1~ and m~2~, separated by a space, representing the total number of tubes M = m~1~^m2^ .

The third line has N positive integers, and the i^th^ number S~i~ is the number of cells that the i^th^ type of cell can divide into in 1 second.

**Output**

An integer representing the minimum amount of time (in seconds) that has elapsed since the start of cell culture until the experiment can begin.

If whichever type of cell Dr. Hanks chooses does not meet the requirements, output the integer -1.

**Sample Input 1**

1

2 1

3

**Sample Output 1**

-1

**Sample Input 2**

2

24 1

30 12

**Sample Output 2**

2

**Hint**

**\[Explanation of Sample 1\]**

After 1 second, the cell divides into 3, after 2 seconds, the cells divides into 9, \..., we can see that no matter how the cells divide, the number of cells is an odd number, so they can never be divided into 2 test tubes.

**\[Explanation of Sample 2\]**

The 1^th^ kind of cell could be evenly divided into 24 tubes at the earliest after 3 seconds, while the 2^nd^ kind could be evenly divided at the earliest after 2 seconds (144/24^1^ = 6 cells per tube). So the experiment could start as early as 2 seconds later.

**\[Data Range\]**

For 50% of the data, m~1~^m2^ ≤ 30000.

For all of the data, there are 1 ≤ N ≤ 10000, 1 ≤ m~1~ ≤ 30000, 1 ≤ m~2~ ≤ 10000, and 1 ≤ S~i~ ≤ 2 × 10^9^.
