**Mine Sweeper**

**Problem Description**

Minesweeper game is a very classic stand-alone game. In a minefield with n rows and m columns, some grids contain mines (called mine lattices) and others do not (called non-mine grids). When the player turns over a non-mine grid, a number will appear indicating how many mines are in the surrounding grid. The goal of the game is to find all the non-mines grids without turning over any mines grids.

Now given the distribution of mines in the minefield with n rows and m columns, please calculate the number of mines around each non-mine grid.

Note: The surrounding grids of a grid include the grids directly adjacent to it in eight directions: upper, lower, left, right, upper left, upper right, lower left, and lower right.

**Input**

The first row is two integers n and m separated by a space, representing the number of rows and columns of the minefield respectively.

The next n lines, each with m characters, describe the distribution of mines in the minefield. The character '\*' means the corresponding grid is a mine grid, and the character '?' indicates that the corresponding grid is a non-mine grid. There is no separator between adjacent characters.

For 100% of the data, 1 ≤ n ≤ 100, 1 ≤ m ≤ 100.

**Output**

The output contains n lines with m characters in each line, describing the entire minefield. Use '\*' to represent mine grids, and use the number of mines around to represent the non-mine grids. There is no separator between adjacent characters.

**Sample Input**

3 3

\*??

???

?\*?

**Sample Output**

\*10

221

1\*1
