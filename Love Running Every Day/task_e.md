**Love Running Every Day**

**Problem Description**

C thought running was fun, so he decided to make a game called *Love Running Every Day*. "*Love Running Every Day*" is an education simulation game, the player needs to be online on time every day, and complete the punch-in task.

The map of this game can be seen as a tree containing n nodes and n-1 edges, each edge connecting two nodes, and any two nodes have a path reachable to each other. The nodes on the tree are numbered as consecutive positive integers from 1 to n.

There are now m players, and the i^th^ player starts at s~i~ and ends at t~i~. At the beginning of each day, all players start from their starting point at the same time in the 0^th^ second and run at the speed of one edge per second without interruption along the shortest path toward their endpoint. After running to the endpoint, the player is considered to have completed the task of punching in. (Since the map is a tree, each player's path is unique)

C wants to know how active the game is, so he places a spotter on each node. The observer at node j will choose to observe players at second w~j~, and a player can be observed by this observer if and only if the player arrives at node j exactly at second w~j~. C wants to know how many people each observer will observe.

Note: We assume that a player will end his game when he reaches his end point, he can't wait a while before being observed by the observer. That is, for a player with node j as his endpoint: if he reaches the end point before second w~j~, the observer at node j can not observe the player; If he reaches the end at second w~j~, the observer at node j can observe the player.

**Input**

The first line has two integers n and m. Where n is the number of nodes in the tree, which is also the number of observers, and m is the number of players.

For the next n-1 lines, there are two integers u and v in each line, which means there is an edge from node u to node v.

This is followed by a line of n integers, where the j^th^ integer is w~j~, which represents the time at which the observer appears at node j.

This is followed by m lines with two integers s~i~ and t~i~ per line, representing the starting and endpoints of a player.

For all data, it is ensured that 1 ≤ s~i~, t~i~ ≤ n, and 0 ≤ w~j~ ≤ n.

**Output**

Output 1 line of n integers, with the j^th^ integer indicating how many people can be observed by the observer at node j.

**Sample Input 1**

6 3

2 3

1 2

1 4

4 5

4 6

0 2 5 1 2 3

1 5

1 3

2 6

**Sample Output 1**

2 0 0 1 1 1

**Sample Input 2**

5 3

1 2

2 3

2 4

1 5

0 1 0 3 0

3 1

1 4

5 5

**Sample Output 2**

1 2 1 0 1

**Hint**

**\[Explanation of Sample 1\]**

For point 1, w~i~=0, so only players starting at point 1 will be observed, so players 1 and 2 are observed, making a total of 2 people observed.

For point 2, no player is at this node at second 2, and a total of 0 players are observed.

For point 3, no player was at this node at second 5, and a total of 0 players were observed.

For point 4, player 1 is observed and a total of 1 player is observed.

For point 5, player 1 is observed and a total of 1 person is observed.

For point 6, player 3 is observed and a total of 1 person is observed.
