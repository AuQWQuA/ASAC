**Jinjin's Savings Plan**

**Problem Description**

Jinjin's pocket money has always been managed by herself. At the beginning of each month, mom gave Jinjin 300 yuan. Jinjin will budget the month's expenses, and he always managed to make the actual expenses and budget the same.

In order for Jinjin to learn how to save, her mother suggested that Jinjin could deposit her money with her at any time in a positive integer multiple of 100 and she would return this with an extra of 20 percent to Jinjin at the end of the year. So Jinjin made a savings plan: At the beginning of each month, after receiving pocket money from her mother, if she expected to have more than or exactly 100 yuan by the end of the month, she would deposit the money in a positive integer multiple of 100 with her mom and keep the rest for herself.

For example, at the beginning of November, Jinjin had 83 yuan in her hand, and her mom gave her 300 yuan. Jinjin expects to spend 180 yuan in November, so she will deposit 200 yuan with her mom and keep 183 yuan for herself. By the end of November, Jinjin will have 3 yuan left.

Jinjin found that the main risk of the savings plan was that the money deposited with her mom couldn't be withdrawn until the end of the year. It is possible that at the beginning of a month, the money she has plus the money given by her mom will not be enough for the original budget of this month. If that happens, Jinjin will have to scrimp and tighten her budget this month.

Now please infer if this will be the case based on Jinjin's budget for each month from January to December 2004. If not, calculate how much money Jinjin will have by the end of 2004, when her mom returns her savings plus 20% to her.

**Input**

The input file *save.in* contains 12 lines of data, each containing a non-negative integer less than 350, representing Jinjin's budget from January to December.

**Output**

The output file *save.out* contains a single line that contains only one integer. If there is a shortage of money in a certain month during the implementation of the savings plan, output --x, x indicate the first month in which this occurs. Otherwise output the number of money Jinjin will have by the end of 2004.

**Sample Input 1**

290

230

280

200

300

170

340

50

90

80

200

60

**Sample Output 1**

-7

**Sample Input 2**

290

230

280

200

300

170

330

50

90

80

200

60

**Sample Output 2**

1580
