**Souvenir**

**Problem Description**

Xiaowei suddenly obtained a super power, he knows the daily price of N kinds of souvenirs in the future T days. The price of a souvenir is the amount of gold coins required to buy the souvenir and the amount of gold coins returned by selling a souvenir.

Every day, Xiaowei can make **unlimited** transactions of the following two types:

1.  Choose a souvenir, if he has enough gold coins, buy the souvenir at its price on that day;

2.  Sell any souvenir he has and get some gold coins back at its price on that day.

The gold coins returned each day can be **immediately** used to buy souvenirs, and souvenirs purchased can **be sold on the same day** for coins. Of course, it's okay to always keep it.

T days later, Xiaowei's super power will disappear. So he must sell **all** the souvenirs on day T for gold.

Xiaowei now has M gold coins and he wants to have as many as possible coins when his super power is gone.

**Input**

The first line contains three positive integers T, N, and M, separated by spaces between every two adjacent numbers, which respectively represent the number of days T, the number of souvenirs N, and the number of gold coins Xiaowei owns now M.

For the next T lines, each line contains N positive integers separated by a space between every two adjacent numbers. The N positive integers in line i are P~i,1~, P~i,2~\... ,P~i,N~, where P~i,j~ represents the price of souvenir j on day i.

**Output**

The output file is a line containing a positive integer representing the maximum coins Xiaowei has when his super power disappears.

**Sample Input 1**

6 1 100

50

20

25

20

25

50

**Sample Output 1**

305

**Sample Input 2**

3 3 100

10 20 15

15 17 13

15 25 16

**Sample Output 2**

217

**Hint**

**\[Explanation of Sample 1\]**

The best strategy is:

Spend all 100 gold coins to buy 5 souvenirs 1 on the second day.

On the third day, 5 souvenirs 1 will be sold and 125 gold coins will be obtained.

On the fourth day, buy 6 souvenirs 1, and there are 5 gold coins left;

On the sixth day, sell all the souvenirs and get 300 gold coins returned. On the fourth day, he should have 5 gold coins left, so he now should have 305 gold coins.

When his super power is gone, Xiaowei will have a maximum of 305 gold coins.

**\[Explanation of Sample 2\]**

The best strategy is:

Spend all coins on 10 souvenirs 1 on the first day.

On the second day, sell all souvenir 1 to get 150 gold coins and buy 8 souvenir 2 and 1 souvenir 3, leaving 1 gold coin;

On the third day, he has to sell all the souvenirs and get 216 gold coins returned. On the second day, he has 1 gold coin left, making a total of 217 gold coins.

When his super power is gone, Xiaowei will have a maximum of 217 gold coins.

**\[Data Scale and Restraints\]**

For 10% of the data, T=1,.

For 30% of the data, T ≤ 4, N ≤ 4, M ≤ 100, and for all prices, 10≤P~i,j~≤100.

For another 15% of the data, T ≤ 100, N=1.

For another 15% of the data, T=2, N ≤ 100.

For 100% of the data, T ≤ 100, N ≤ 100, M ≤ 10^3^, and for all prices, 1 ≤ P~i,j~ ≤ 10^4^. The data guarantees that the number of gold coins that Xiaowei owns cannot exceed 10^4^ at any time.
