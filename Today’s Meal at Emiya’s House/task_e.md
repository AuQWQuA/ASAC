**Today's Meal at Emiya's House**

**Problem Description**

Emiya is a high school student who has mastered n **cooking methods** and uses m **main ingredients**. For the sake of narration, we numbered the cooking methods from 1 to n and the main ingredients from 1 to m.

Each dish made by Emiya will use **exactly one** cooking method and **exactly one** main ingredient. More specifically, Emiya will make a~i,j~ different dishes using the cooking method i and main ingredient j (1 ≤ i ≤ n, 1 ≤ j ≤ m). This means that Emiya will make a total of different dishes.

Emiya is going to prepare a meal for Yazid and Rin today, but the three have different requirements for the dishes. More specifically, for a recipe that includes k dishes:

\- Emiya will not make everyone stay hungry, so he will make **at least one dish**, namely k≥1.

\- Rin wants to taste dishes made by different cooking methods, so she requires each dish to be **cooked differently**.

\- Yazid doesn't want to taste too many dishes with the same ingredient, so he requires each **main ingredient** to be used in at most **half** of the dishes (i.e. ⌊⌋ dishes)

Here ⌊ x ⌋ is the bottom-round function, indicating the maximum integer not exceeding x.

This doesn't bother Emiya, but he wants to know how many different collocation schemes are available. Two schemes differ if and only if there exists at least one dish that appears in one scheme but not in the other.

Emiya comes to you and asks you to help him calculate. All you need to do is tell him the result of the number of collocation schemes that meet all the requirements modulo the prime number 998,244,353.

**Input**

The first line contains two integers n and m, separated by a single space.

From line 2 to line n+1, there are m integers separated by a single space in each line, where the m numbers in line i+1 are a~i,1~, a~i,2~, \..., a~i,m~.

**Output**

There's only one integer in a single line, which is the number of solutions modulo 998,244,353.

**Sample Input 1**

2 3

1 0 1

0 1 1

**Sample Output 1**

3

**Sample Input 2**

3 3

1 2 3

4 5 0

6 0 0

**Sample Output 2**

190

**Sample Input 3**

5 5

1 0 0 1 1

0 1 0 1 0

1 1 1 1 0

1 0 1 0 1

0 1 1 0 1

**Sample Output 3**

742

**Hint**

**\[Explanation of Sample 1\]**

Since Emiya can only cook at most one dish for each group i, j in this sample, we describe a dish directly by giving the cooking method and the serial number of the main ingredient.

Examples of solutions that meet the requirements include:

-Make a dish that uses cooking method 1, main ingredient 1, and a dish that uses cooking method 2, main ingredient 2

-Make a dish that uses cooking method 1, main ingredient 1, and a dish that uses cooking method 2, main ingredient 3

-Make a dish that uses cooking method 1, main ingredient 3, and a dish that uses cooking method 2, main ingredient 2

So the output is 3 mod 998,244,353 = 3. It should be noted that all schemes containing only one dish are nonconforming, as the only main ingredient appears in more than half of the dishes, which does not meet Yazid's requirements.

**\[Explanation of Sample 2\]**

Emiya must cook at least 2 dishes.

The number of eligible plans with 2 dishes is 100.

The number of eligible plans with 3 dishes is 90.

So the number of eligible solutions is 100 + 90 = 190.

**\[Data Range\]**

  ------------- ---- ---- ---------- ------------- ----- --------- -----------
  Test Points   n=   m=   a~i,j~\<   Test Points   n=    m=        a~i,j~\<
  1             2    2    2          7             10    2         10^3^
  2             2    3    2          8             10    3         10^3^
  3             5    2    2          9\~12         40    2         10^3^
  4             5    3    2          13\~16        40    3         10^3^
  5             10   2    2          17\~21        40    500       10^3^
  6             10   3    2          22\~25        100   2×10^3^   998244353
  ------------- ---- ---- ---------- ------------- ----- --------- -----------

For all test points, guarantee 1 ≤ n ≤ 100, 1 ≤ m ≤ 2000, and 0 ≤ a~i,j~ \< 998,244,353.
