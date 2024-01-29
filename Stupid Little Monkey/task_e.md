**Stupid Little Monkey**

**Problem description**

Stupid little monkey's vocabulary is very small, every time doing English multiple choice questions made him very headache. But he found a way, and it proved to be a very efficient to get it right!

The method is described as follows: Assume that maxn is the number of occurrences of the most frequent letter in a word, and minn is the number of occurrences of the least frequent letter in a word. If maxn-minn is a prime number, the stupid little monkey thinks it is a "Lucky Word", and this word is likely to be the correct answer.

**Input**

The input file contains one word in which only lowercase letters may appear and is less than 100 in length.

**Output**

The output file consists of two lines. The first line is a string. If the input word is a Lucky Word, output "Lucky Word", otherwise output "No Answer".

The second line is an integer that prints the value of maxn-minn if the input word is a Lucky Word, and 0 otherwise.

**Sample Input 1**

error

**Sample Output 1**

Lucky Word

2

**Sample Input 2**

olympic

**Sample Output 2**

No Answer

0

**Hint**

**\[Explanation of Sample 1\]**

The most frequent letter "r" in the word "error" appears three times, and the least frequent letter appears once. 3-1=2, and 2 is a prime number.

**\[Explanation of Sample 2\]**

The most frequent letter "i" in the word olympic appears once, and the least frequent letter appears once. 1-1=0, 0 is not a prime number.
