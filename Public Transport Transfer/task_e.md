**Public Transport Transfer**

**Problem Description**

In order to encourage people to use public transportation, city B, a famous tourist city, has launched a preferential program of subway-bus transfer:

1.  After a subway ride, you can get a special ticket, which is valid for 45 minutes. You can use the special ticket during the validity period to take a bus with a fare no more than the subway fare for free. By "during the validity period", it means that the time between the starting time of the bus ride and the starting time of the subway ride is less than or equal to 45 minutes, namely: t~bus~− t~subway~ ≤ 45.

2.  The special tickets can be accumulated, that is, you can take the subway several times and then use the special tickets to take the bus continuously.

3.  When taking the bus, if there are available special tickets, one must use the special ticket; If there are more than one special tickets that meet the condition, the earliest special ticket will be consumed first.

    Now that you have Xiaoxuan's recent public transport records, can you help him calculate his expenses?

**Input**

The first line of the input file contains a positive integer, n, representing the number of ride records.

This is followed by n lines, each containing three integers separated by spaces. The first integer in row i represents the means of transportation recorded in record i, with 0 representing the subway and 1 representing the bus; the second integer represents the price of the ticket of record i; the third integer represents the starting time ti (the number of minutes from time 0) of record i .

We ensure that trips are recorded in chronological order and that there won't be two trips recorded in the same minute.

**Output**

The output file is a line containing a positive integer representing the total cost of Xiaoxuan's trip.

**Sample Input 1**

6

0 10 3

1 5 46

0 12 50

1 3 96

0 5 110

1 6 135

**Sample Output 1**

36

**Sample Input 2**

6

0 5 1

0 20 16

0 7 23

1 18 31

1 4 38

1 7 68

**Sample Output 2**

32

**Hint**

**\[Explanation of Sample 1\]**

In the first record, he spent 10 yuan for taking the subway at the 3^rd^ minute.

In the second record, when taking the bus in the 46^th^ minute, he could use the special ticket obtained by taking the subway in the first record, so it did not cost.

In the third record, he spent 12 yuan for taking the subway at the 50^th^ minute.

In the fourth record, he took the bus at the 96^th^ minute. Because it has been more than 45 minutes after taking the subway in the third record, so the special ticket is invalid. He spent 3 yuan on the bus.

In the fifth record, he spent 5 yuan for taking the subway at the 110^th^ minute.

In the sixth record, he took the bus in the 135^th^ minute. At this time, he only had the special ticket obtained by taking the subway in the fifth record. However, the bus fare of this record was 6 yuan, which was higher than the subway fare of 5 yuan in the fifth record, so he could not use the special ticket and spent 6 yuan on the bus.

The total cost is 36 yuan.

**\[Explanation of Sample 2\]**

In the first record, he spent 5 yuan for taking the subway at the 1^st^ minute.

In the second record, he spent 20 yuan for taking the subway at the 16^th^ minute.

In the third record, he spent 7 yuan for taking the subway at the 23^rd^ minute.

In the fourth record, he took the bus at the 31^st^ minute. At this time, only the subway fare in the second record was higher than the bus fare of this time, so he used the special ticket obtained by taking the subway in the second record.

In the fifth record, he took the bus at the 38^th^ minute. At this time, the special ticket obtained by taking the subway in the first and third records can be used. The earliest special ticket obtained by taking the subway in the first record can be used.

In the sixth record, he took the bus at the 68^th^ minute, using the special ticket obtained by taking the subway in the third record.

The total cost is 32 yuan.

**\[Data Scale and Constraints\]**

For 30% of the data, n ≤ 1000, t~i~ ≤ 10^6^.

For another 15% of the data, t~i~ ≤ 10^7^, price~i~ are all the same.

For another 15% of the data, t~i~ ≤ 10^9^, price~i~ are all the same.

For 100% of the data, n ≤ 10^5^, t~i~ ≤ 10^9^, 1 ≤ price~i~ ≤ 1000.
