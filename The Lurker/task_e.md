**The Lurker**

**Problem Description**

Country R and S are locked in a war and each side is sending spies into the other, looking for opportunities. After going through hardships, C, the spy from country R who was lurking in country S, finally found out the coding rules of S's military code:

1.  The original information to be sent by the military of S is encrypted and then sent over the network. The contents of the original information and the encrypted contents are all composed of capital letters 'A' to 'Z' (without any other characters such as spaces).

2.  S has a "secret word" for each letter. The process of encryption is to replace all the letters in the original message with their corresponding "secret word".

3.  Each letter corresponds to a unique "secret word", and different letters correspond to different "secret words". The "secret word" can be the same as the original letter.

    For example, if the secret word of 'A' is specified as 'A' and the secret word of\' 'B' is 'C' (other letters and secret words are omitted), the original message 'ABA' will be encrypted as 'ACA'.

    Now, C has got an encrypted message sent on the S network and its corresponding original message through the inside. C hopes to use this message to decipher the military code of S. The decoding process of C is as follows: scan the original message, find the corresponding uppercase letter y in the encrypted message of the letter x in the original message (representing any uppercase letter), and consider y as x's secret word in the password. Keep repeating this process until it stops at one of the following states:

```{=html}
<!-- -->
```
1.  After all the information is scanned, all 26 letters of 'A' - 'Z' have appeared in the original information and their corresponding "secret words" have been obtained.

2.  All messages were scanned, but there was a letter (or letters) that did not appear in the original message.

3.  It is found in the scan that there are obvious contradictions or errors in the information (in violation of the code rules of country S). For example:

    If a message like "XYZ" is translated into "ABA", then the "different letters corresponding to different secret words" rule will be violated.

    While C was busy, the headquarters of R sent another telegram asking him to translate another encrypted message that had just been intercepted from country S. Now please help C: try to use the information he got from the inside to crack the code. Then, use the decoded code to translate the encrypted message in the telegram.

    **Input**

    There are a total of 3 lines, each line is a string between 1 and 100 in length.

    The first line is the enciphered message that C had.

    The second line is the original message corresponding to the enciphered message in the first line.

The third line is the enciphered message that the headquarters of R asked C to translate.

The input data ensures that all the strings are only made of capital letters 'A' - 'Z', and the length of the first line and the second line are the same.

**Output**

There is only one line.

If circumstances 2 or 3 occurred when the decoding process stopped, output "Failed" (without quotation marks, note that the first letter is capitalized and the other letters are lowercase).

Otherwise, output the original message obtained by translating the encrypted message in the cable using the cipher.

**Sample Input 1**

AA

AB

EOWIE

**Sample Output 1**

Failed

**Sample Input 2**

QWERTYUIOPLKJHGFDSAZXCVBN

ABCDEFGHIJKLMNOPQRSTUVWXY

DSLIEWO

**Sample Output 2**

Failed

**Sample Input 3**

MSRTZCJKPFLQYVAWBINXUEDGHOOILSMIJFRCOPPQCEUNYDUMPP

YIZSDWAHLNOVFUCERKJXQMGTBPPKOIYKANZWPLLVWMQJFGQYLL

FLSO

**Sample Output 3**

NOIP

**Hint**

**\[Explanation of Sample 1\]**

The letters 'A' and 'B' in the original message correspond to the same secret word, so output "Failed".

**\[Explanation of Sample 2\]**

The letter 'Z' does not appear in the original information, so output "Failed".
