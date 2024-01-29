**Sightseeing bus**

**Problem Description**

Y City is a charming town with n beautiful scenic spots. Due to the increasing number of tourists coming, Y city has specially arranged a sightseeing bus to provide more convenient transportation services for tourists. The sightseeing bus appears at scenic spot 1 in minute 0 and then goes to scenic spots 2,3,4,c\...,n. It takes D~i~ minutes to drive from scenic spot i to scenic spot i+1. At any given moment, the bus can only drive forward or wait at the scenic spot.

Suppose there are m tourists in total, and each tourist needs to travel from one scenic spot to another one. The i~th~ tourist arrives at scenic spot A~i~ at minute T~i~ and wants to travel to scenic spot B~i~ (A~i~ \< B~i~). To make all the passengers reach their destination smoothly, the bus must wait for all the passengers who need to leave from the scenic spot to get on the bus at each station before starting to the next scenic spot.

It is assumed that it does not take time for passengers to get on and off the bus. The travel time of a passenger is the moment of his arrival at the destination minus the moment of his arrival at the departure station. Since there is only one sightseeing bus and sometimes it has to stop to wait for other passengers, passengers complain that the travel time is too long. So the clever driver, ZZ, fitted the bus with k nitrogen accelerators, each of which could make one of the D~i~ -1. You can use multiple accelerators for the same D~i~, but you must ensure that D~i~ ≥ 0 after using the accelerator.

So how can ZZ arrange the use of accelerators so that the sum of travel time of all passengers is minimized?

**Input**

The first line contains 3 integers n, m, and k, separated by a space between every two integers. They represent the number of attractions, passengers, and nitrogen accelerators respectively.

The second line contains n-1 integers, separated by spaces. And the ith number represents the time it takes to travel from the ith attraction to the i+1 attraction, that is, D~i~.

There are three integers T~i~, A~i~, and B~i~ in each line from line 3 to line m+2, separated by a space between every two integers. Line i+2 indicates the moment when the i~th~ passenger arrives at the departure point, the number of the departure point, and the number of the destination point.

**Output**

An integer representing the minimum total travel time.

**Sample Input**

3 3 2

1 4

0 1 3

1 1 2

5 2 3

**Sample Output**

10

**Hint**

**\[Explanation of Sample\]**

Use 2 accelerators for D~2~, and the time from point 2 to point 3 will be 2 minutes.

The bus starts from attraction 1 in the first minute, arrives at attraction 2 in the second minute, leaves from attraction 2 in the fifth minute, and arrives at attraction 3 in the seventh minute.

Travel time for the 1st passenger: 7-0=7 minutes.

Travel time for the 2nd passenger: 2-1=1 minute.

Travel time for the 3rd passenger: 7-5=2 minutes.

Total time: 7+1+2=10 minutes.

\[Data Range\]

For 10% of the data, k=0.

For 20% of the data, k=1.

For 40% of the data, 2 ≤ n ≤ 50, 1 ≤ m ≤ 10^3^, 0 ≤ k ≤ 20, 0 ≤ D~i~ ≤ 10, 0 ≤ T~i~ ≤ 500.

For 60% of the data, 1 ≤ n ≤ 100, 1 ≤ m ≤ 10^3^, 0 ≤ k ≤ 100, 0 ≤ D~i~ ≤ 100, 0 ≤ T~i~ ≤ 10^4^.

For 100% of the data, 1 ≤ n ≤ 10^3^, 1 ≤ m ≤ 10^4^, 0 ≤ k ≤ 10^5^, 0 ≤ D~i~ ≤ 100, 0 ≤ T~i~ ≤ 10^5^.
