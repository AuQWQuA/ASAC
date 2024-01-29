**Jinming's Budget Plan**

**Problem description**

Jinming is very happy today. It's time to get the keys to the new house. The new house had a very spacious room to himself only. To make him even happier, his mother said to him yesterday, "What you need to buy and how to decorate your room is up to you, as long as it does not exceed n yuan." This morning, Jinming started to make a budget. He divided the items he wanted to buy into two categories: main items and accessories. Accessories belong to a certain main item. The following table shows some examples of main items and accessories:

---

  **Main Item**   **Accessory**
  Computer        Printer, scanner
  Bookcase        Book
  Table           Lamp, Stationery
  Chair           None

---

If he wants to buy an item classified as an accessory, he must first buy the main item to which the accessory belongs. Each main item can have 0, 1, or 2 accessories. Accessories no longer have accessories subordinate to themselves. Jinming wants to buy a lot of things, which will definitely exceed his mother's limit. Therefore, he specified a degree of importance for each item, divided them into five levels: with integers 1 to 5, the fifth level is the most important. He also found out the price of each item on the internet (the prices are all multiples of 10 yuan). He wanted to maximize the sum of the product of the price and the degree of importance of each item without exceeding n yuan (which could be equal to N yuan).

Let the price of the item j be v~j~, and the importance be w~j~. A total of k items are selected, numbered j~1~, j~2~\... j~k~, then the sum is:

$$
v_{j_1} \times w_{j_1}+v_{j_2} \times w_{j_2}+ \dots +v_{j_k} \times w_{j_k}
$$

Please help Jinming to design a shopping list that meets the requirements.

**Input**

The first line of the input file has two integers separated by a space, where n is the total amount of money, and m is the number of items he wants to buy.

From line 2 to line m+1, there are 3 integers each line, where v~i~, p~i~, q~i~ in line i+1 represents the price of the item i, the degree of importance of the item i, and the main item it corresponds to. If q~i~=0, it indicates that the item is a main item.

**Output**

The output file has only one positive integer, representing the answer.

**Sample Input**

1000 5

800 2 0

400 5 1

300 5 1

400 3 0

500 2 0

**Sample Output**

2200

**Hint**

**Data Size**

For all the test points, ensure that 1 ≤ n ≤ 3.2 × 10^4^, 1 ≤ m ≤ 60, 0 ≤ v~i~ ≤ 10^4^, 1 ≤ p~i~ ≤ 5, 0 ≤ q~i~ ≤ m, the answer does not exceed 2 × 10^5^
