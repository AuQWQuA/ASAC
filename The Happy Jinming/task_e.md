**The Happy Jinming**

**Problem description**

Jinming is very happy today. It's time to get the keys to the new house. The new house has a very spacious room to himself only. To make him even happier, his mother said to him yesterday, "What you need to buy and how to decorate your room is up to you, as long as it does not exceed N yuan." This morning, Jinming started to make a budget, but he wants to buy too many things, it would definitely exceed his mother's budget limit. Therefore, he specified a degree of importance for each item, divided them into five levels: with integers 1 to 5, the fifth level is the most important. He also found out the price of each item on the internet (the prices are all integers). He wanted to maximize the sum of the product of the price and the degree of importance of every item without exceeding N yuan (which could be equal to N yuan).

Let the price of the j item be v\[j\], and the importance be w\[j\]. A total of k items are selected, numbered j~1~, j~2~\... j~k~, then the sum is:

v\[j~1~\]×w\[j~1~\]+v\[j~2~\]×w\[j~2~\]+ ...+v\[j~k~\]×w\[j~k~\].

Please help Jinming to design a shopping list that meets the requirements.

**Input**

The first line of the input file has two positive integers separated by a space: N, m (Where N (\<30000) is the total amount of money, m (\<25) is the number of items he wants to buy.)

From line 2 to line m+1, line j gives the basic data for items numbered j-1, each with 2 non-negative integers: v, p (where v represents the price of the item (v ≤ 10000), p represents the degree of importance of the item (1\~5).)

**Output**

The output file has only one positive integer, which is the maximum value (\<100000000) of the sum of the product of the price and the degree of importance of items that do not exceed the total amount of money.

**Sample Input**

1000 5

800 2

400 5

300 5

400 3

200 2

**Sample Output**

3900
