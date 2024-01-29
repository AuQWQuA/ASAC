**Palindrome Dates**

**Problem Description**

In everyday life, a unique date can be represented by three elements: year, month, and day.

Niuniu is used to represent a date with eight digits, where the first four digits represent the year, the next two digits represent the month, and the last two digits represent the day. There is only one way to represent a date, and two different dates will not be represented in the same way.

Niuniu argues that a date is palindromic if and only if the 8-digit number representing the date is palindromic. Now, Niuniu wants to know how many of the actual dates between the two dates he specified are palindromes(including these two dates themselves).

An 8-bit number is palindromic if and only if for all i (1≤ i ≤8), the i^th^ number from left to right and the (9-i)^th^ number (that is, the i^th^ number from right to left) are the same.

For example:

• For November 19, 2016, denoted by the 8-digit number 20161119, it is not palindromic.

• For January 2, 2010, denoted by the 8-digit number 20100102, it is palindromic.

• For October 2, 2010, represented by the 8-digit number 20101002, it is not palindromic.

There are 12 months in a year:

There are 31 days in January, March, May, July, August, October, and December; There are 30 days in April, June, September, and November; For February, there are 29 days in leap years and 28 days in common years.

A year is a leap year if and only if it meets one of two conditions:

1\. The year is a multiple of 4, but not a multiple of 100;

2\. The year is a multiple of 400.

For example:

• the following years are leap years: 2000,2012,2016.

• the following years are common: 1900,2011,2014.

**Input**

Two lines, each line contains an 8-digit number.

The first line represents the start date specified by Niuniu.

The second line represents the termination date specified by Niuniu.

Ensure that date1 and date2 are real dates with a 4-digit year and a non-zero first digit.

Ensure that date1 is never later than date2.

**Output**

An integer indicating how many dates between date1 and date2 are palindromic.

**Sample Input**

20110101

20111231

**Sample Output**

1

**Hint:**

**Sample Input 2**

20000101\
2010123

**Sample Output 2**

2

**\[Explanation of Samples\]**

For sample 1, the eligible date is 20111102.

For sample 2, the eligible date is 20011002 and 20100102.

For 60% of the data, date1=date2.
