**Buying Pencils**

**Problem Description**

Teacher P needs to go to the store to buy n pencils as gifts for children to participate in NOIP. She found that there were three different packages of pencils in the store, and the number of pencils in each package could be different, and the price could also be different. To be fair, Teacher P decided to buy pencils with only one kind of packaging.

The store does not allow the packaging of pencils to be opened, so Teacher P may need to buy more than n pencils to give gifts to children.

Now Teacher P wants to know how much it would cost at least to buy at least n pencils if the store has enough of each package.

**Input**

The first line contains a positive integer n representing the number of pencils needed.

Each of the next three lines describes a package of pencils with two positive integers: the first integer represents the number of pencils in the package, and the second integer represents the price of the package.

It is ensured that all seven numbers are positive integers at most 10,000.

**Output**

There is an integer, indicating the minimum amount of money that teacher P needs to spend.

**Sample Input**

57

2 2

50 30

30 27

**Sample Output**

54

**Hint**

The three types of pencil packaging are:

2 pieces, the price is 2;

50 pieces, the price is 30;

30 pieces, the price is 27.

Teacher P needs to buy at least 57 pencils.

If she chooses to buy the first package, then she needs to buy 29 copies, for a total of 2×29=58 sticks, and the cost is 2×29=58.

Teacher P will choose to buy the third package, which requires two copies. We ended up with a larger number of pencils, 30×2=60, but the cost was reduced to 27×2=54, less than the first type.

For the second package, although the price of each pencil is the lowest, it is necessary to buy two copies to get enough pencils for the children, and the actual cost is 30×2=60, so Teacher P will not choose it.

So the final output is 54.
