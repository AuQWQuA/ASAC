**Road Game**

**Problem description**

Xiaoxin is playing a simple computer game.

In the game, there is a circular road with n robot factories on the road, and two adjacent robot factories are connected by a short road. Xiaoxin takes a robot factory as the starting point and numbers the n robot factories from 1 to n in clockwise order. Since the road is circular, the n^th^ robot factory and the first robot factory are connected by a section of road. Xiaoxin numbered these n sections of road connecting the robot factories also as 1\~n, and let the i^th^ section of road connects the i^th^ robot factory and the i+1^th^ robot factory (1≤ i ≤ n-1), and the n^th^ section of road connects the n^th^ robot factory and the first robot factory.

During the game, some gold coins will appear on each section of road in each unit of time, and the amount of gold coins will change over time, that is, the amount of gold coins on the same section of road in different units of time may be different. Xiaoxin needs the help of the robots to collect the gold coins on the road. Robots must be bought in the robot factory with some gold coins, once the robot be bought, it will walk along the circular road clockwise, walk once on each unit of time, that is, from the current robot factory to the next adjacent robot factory, and will collect all the gold coins along the road to Xiaoxin. For instance, Xiaoxin bought a robot in the robotic factory i (1≤ i ≤n) , the robot will begin from the robot factory i, walking on the road clockwise. For the first unit of time, it will walk through road i, arrived at robot factory i+1 (if i = n, robots will reach the first robot factory), and collect all the golds on the road i to Xiaoxin.

In the game, it is not allowed to exist two or more robots on the circular road at the same time, and each robot can walk on the circular road at most p times. When Xiaoxin buys the robot, he needs to set the walking times for the robot, and the walking times can be any integer between 1\~p. The robot on the road will automatically disappear after finishing the specified number of walks, Xiaoxin must immediately buy a new robot in any robot factory, and set a new number of walks for the new robot.

Here are some additional notes for the game:

1.  The game starts from the first time Xiaoxin buys a robot.

2.  Buying the robot and setting the walking times of the robot can be done instantaneously, which does not take time.

3.  Buying a robot and the robot walking are two independent processes. When a robot is walking, no robot can be purchased. The robot can walk only after buying the robot and setting the walking times of the robot.

4.  The cost of purchasing a robot in the same robot factory is the same, but the cost of purchasing a robot in different robot factories is not necessarily the same.

5.  The gold coins spent to purchase robots will be deducted from the gold coins collected by Xiaoxin at the end of the game, so during the game, Xiaoxin does not have to worry about not being able to buy robots due to the lack of gold coins. Because of this, the amount of coins collected can be negative after the game is over.

Now we know the number of gold coins in each unit of time on each section of road and the cost of buying robots in each robot factory. Please tell Xiaoxin how many gold coins he can collect at most after deducting the cost of buying robots after m units of time.

**Input**

The first line has three positive integers, n, m, p, the meanings are as described above.

The next n lines each has m positive integers, separated by spaces. The i^th^ line describes the number of gold coins that appear per unit of time on road i ( 1 ≤ number of gold coins ≤ 100), which means the j^th^ (1 ≤ j ≤ m) number in the i^th^ line is the number of gold coins that appear on road i in the j^th^ unit of time.

In the last line, there are n integers separated by spaces, where the i^th^ number represents the amount of gold coins needed to purchase a robot in robot factory i (1 ≤ number of gold coins ≤ 100).

**Output**

The output file consists of a line with one integer indicating the maximum number of gold coins that Xiaoxin can collect in m units of time after deducting the gold coins spent on buying the robot.

**Sample Input 1**

2 3 2

1 2 3

2 3 4

1 2

**Sample Output 1**

5

**Hint**

For 40% of the data, 2 ≤ n ≤ 40, 1 ≤ m ≤ 40.

For 90% of the data, 2 ≤ n ≤ 200 and 1 ≤ m ≤ 200.

For 100% of the data, 2 ≤ n ≤ 1000,1 ≤ m ≤ 1000, and 1 ≤ p ≤ m.
