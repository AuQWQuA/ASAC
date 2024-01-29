**The Escape of the Watchman**

**Problem description**

Demon hunter Illidan is an ambitious man who betrays the Night Elves and attempts to lead the Naga tribe deep in the sea to defect. The Watchmen were besieged in the encounter with Illidan and were stranded on a large deserted island.

To kill the Watchmen, Illidan began casting a spell on the deserted island, which would soon sink the island. And by then, everyone on the island will be dead.

The Watchmen runs at a speed of 17m/s, which is not enough to escape the desert island. Fortunately, the Watchman has a flash spell, which can move 60 meters in 1 second, but costs 10 mana points per flash spell. The Watchmen regenerate mana points at a rate of 4 points per second and can only regenerate while staying put.

Now we know the Watchman's initial mana points is M, the distance between his initial position and the exit of the island is S, and the time before the island sank is T. Your task is to write a program to help the Watchman calculate how fast he can escape the island, and if he can't escape, output the distance the Watchman can travel in the remaining time.

Note: The time for Watchman running, flashing, or resting activities are measured in seconds (s), and the duration of each activity is an integer of seconds. Distance is measured in meters (m).

**Input**

The input file contains three non-negative integers M, S, and T, separated by spaces.

**Output**

The output file contains two lines:

The first line is string, "Yes" or "No", indicates whether the Watchman can escape the island.

The second line contains an integer. When the first line is "Yes", the integer indicates the minimum time for the Watchman to escape from the desert island. When the first line is "No", the integer indicates the maximum distance the Watchman can travel.

**Sample Input 1**

39 200 4

**Sample Output 1**

No

197

**Sample Input 2**

36 255 10

**Sample Output 2**

Yes

6

**Hint**

For 30% of the data, 1 ≤ T ≤ 10, 1 ≤ S ≤ 100.

For 50% of the data, 1 ≤ T ≤ 1000, 1 ≤ S ≤ 10^4^.

For 100% of the data, 1 ≤ T ≤ 3 × 10^5^, 0 ≤ M ≤ 10^3^, 1 ≤ S ≤ 10^8^.
