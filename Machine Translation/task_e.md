**Machine Translation**

**Problem Description**

Xiao Chen has a piece of machine translation software installed on his computer, which he often uses to translate English articles. The working of this translation software is very simple. It just replaces each English word with its corresponding Chinese meaning from beginning to end. For each English word, the software will first look up the Chinese meaning of the word in the memory, if it is in the memory, the software will use it to translate; If it is not in the memory, the software will look in the dictionary in external storage, find out the Chinese meaning of the word and translate it, and put the word and the translation into the memory for subsequent search and translation.

Suppose there are M units in memory, each of which can hold one word and its translation. Each time the software saves a new word into memory, if the number of words in the current memory does not exceed M-1, the software will save the new word into an unused memory unit. If M words have been stored in memory, the software will empty the memory of the earliest word to make room for the new word.

Suppose that the length of an English text is N words. Given the article to be translated, how many times does the translation software need to look up the dictionary in external storage? Assume that there are no words in memory before the translation starts.

**Input**

There are two lines. Every two numbers are separated by a space.

The first line contains two positive integers M and N, representing the memory capacity and the length of the article.

The second line contains N non-negative integers, each number (not exceeding 1000) representing an English word, in the order of the passage. Two words in a text are the same word if and only if their corresponding non-negative integers are the same.

**Output**

There is an integer indicates the number of times the software needs to look up the dictionary.

**Sample Input 1**

3 7

1 2 1 5 4 4 1

**Sample Output 1**

5

**Hint**

**Explanation of Sample**

The dictionary is looked up as follows: Each line represents the translation of a word, and the numbers before the colon represent the status of memory:

1\. '1': Look for word 1 and load it into memory.

2\. '1 2': Look for word 2 and load it into memory.

3\. '1 2': Find the word 1 in memory.

4\. '1 2 5': Look for word 5 and load it into memory.

5\. '2 5 4': Look for word 4 and load it into memory to replace word 1.

6\. '2 5 4': Find word 4 in memory.

7\. '5 4 1': Look for word 1 and load it into memory to replace word 2.

A total of five dictionary searches were made.

**Data Range**

For 10% data, M=1, N≤5;

For 100% data, 1≤M≤100, 1≤N≤1000.
