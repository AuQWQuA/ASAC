**Energy Necklace**

**Problem description**

On Mars, every Martian wears an energy necklace. There are N energy beads on the necklace. The energy bead is a bead with a head mark and a tail mark that each mark corresponds to a positive integer. Also, for two adjacent beads, the tail mark of the former bead must equal to the head mark of the latter bead. Only then, through the action of the sucker (a Martian organ that absorbs energy), can the two beads fuse into one bead, releasing energy that can be absorbed by the sucker. If the head of the previous energy bead is marked as m, and its tail as r, and the head of the latter bead is marked as r, and its tail as n, then the energy released after the fusion is m × r × n (Mars units), and the head of the newly produced bead is marked as m, and its tail as n.

When needed, Martian use suckers to hold two beads next to each other and fuse them until only one bead is left on the necklace. Obviously, the total energy obtained by different fusion order is different. Please design a fusion order that maximizes the total energy released by a necklace.

For example: let N=4. The head and tail marks of the 4 beads are (2,3) (3,5) (5,10) (10,2). We use the notation ⊕ to denote the fuse operation of two beads, and (j⊕k) to denote the energy released by the fusion of the j^th^ and k^th^ beads. Then the energy released by the fourth and the first beads after polymerization is:

(4⊕1)=10 × 2 × 3=60.

The total energy released by the fusion order in which the necklace can obtain the optimal value is

((4⊕1)⊕2)⊕3）=10 × 2 × 3 + 10 × 3 × 5 + 10 × 5 × 10 = 710.

**Input**

The first line of the input file is a positive integer N (4 ≤ N ≤ 100), representing the number of beads on the necklace. The second line contains N positive integers separated by spaces, all of which do not exceed 1000. The i^th^ number is the head mark of the i^th^ bead (1 ≤ i ≤ N), when i \< N, the tail mark of i^th^ bead should be equal to the head mark of the i+1^th^ bead. The tail mark of the N^th^ bead should be equal to the head mark of the first bead.

You can determine the order of the beads by this: place the necklace on the table without crossing, specify the first bead randomly, and then determine the order of the other beads in a clockwise direction.

**Output**

A positive integer E (E ≤ 2.1 × 10^9^), which is the total energy released by an optimal fusion order.

**Sample Input**

4

2 3 5 10

**Sample Output**

710
