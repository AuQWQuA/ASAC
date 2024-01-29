**Word Count**

**Problem Description**

Most text editors have a word lookup function, which can quickly locate the position of a particular word in the article, and some can also count the number of times a particular word appears in the article.

Now, please write a program to complete such a function: When given a word, output the number of times it appears in a given text and the location where it first appears. Note: When matching words, it is case-insensitive, but it requires an exact match, that is, the given word must be the same (case-insensitive) as an independent word in the article. If the given word is only part of a word in the article, it is not an exact match.

**\[Constraints\] **

1 ≤ the length of the word ≤ 10.

1 ≤ the length of the article ≤ 1,000,000

**\[Explanation for Sample Input and Output 1\]**

The output indicates that the given word "To" appears twice in the text, with the first occurrence at 0.

**\[Explanation for Sample Input and Output 2\]**

Indicates that the given word "to" does not appear in the article, therefore, outputs the integer -1.

**Input**

The first line contains a string containing only letters, representing the given word.

The second line contains a string, which may contain only letters and spaces, indicating the given article.

**Output**

There is only one line. If the given word is found in the article, it outputs two integers which are the number of times the word appears in the article and the position of the first occurrence (that is, the position of the first letter of the word in the article when the word first occurred, starting from 0), separated by a space. If the word does not appear in the article, an integer -1 is output directly.

**Sample Input 1**

To

to be or not to be is a question

**Sample Output 1**

2 0

**Hint**

**Sample Input 2**

to

Did the Ottoman Empire lose its power at that time

**Sample Output 2**

-1
