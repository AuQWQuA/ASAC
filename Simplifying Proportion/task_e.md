**Simplifying Proportion**

**Problem Description**

On social media, it's common to see polls and their results on whether you agree or disagree with a point of view. For example, if 1498 people support an idea and 902 people who oppose it, the ratio of yes to no can be simply written as 1498 to 902.

However, most people would not be satisfied if the results were presented in this way. Because the numbers are so large, it's hard to see the relationship at a glance. For the above example, if the ratio is recorded as 5:3, although this has a certain error with the real results, it can still reflect the survey results quite accurately and more intuitively.

Now, given the number of supporters A, the number of opponents B, and an upper limit L, please simplify A to B into A' to B'. Under the condition that A' and B' are not greater than L and A' and B' are co-prime (the greatest common divisor of two integers is 1), make sure A'/B' ≥ A/B and the value of A'/B' - A/B is as small as possible.

**Input**

The input is a line that consists of three integers, A, B, and L, separated by spaces, respectively indicating the number of supporters, the number of opponents and the upper bound.

For 100% data, 1 ≤ A ≤ 1,000,000, 1 ≤ B ≤ 1,000,000, 1 ≤ L ≤ 100, A/B ≤ L.

**Output**

The output is a line that consists of two integers, A' and B', separated by a space, which represents the reduced proportion.

**Sample Input**

1498 902 10

**Sample Output**

5 3
