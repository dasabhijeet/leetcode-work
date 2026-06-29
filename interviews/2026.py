# Date: 25 June 2026

Given a string s, return the index of the first non-repeating character.
If no such character exists, return -1.

Input: s = "leetcode"
Input: s = "loveleetcode"
Input: s = "aabb"

#test

'''
val2 = 0
val = []
c=0

for x in s:
    for y in x:
        print(y)
        c = c+1
    val.append(c)
    print(c)
'''


#LEETCODE

s = "loveleetcode"


for i in s:
    if s.count(i) == 1:
        print("True")
        print("Value is:",i)
        break
    else:
        print("False")


### ### ### ### ###

dic1 = []
dic2 = []

def reverse_order(s):
    for word in s:
        dic1.append(word)
    #print(dic1)
    #print(len(dic1))
    
    for i in range(len(dic1) - 1, -1, -1):
        print(dic1[i])

s = "welcome to the jungle"
reverse_order(s)

#Output: "jungle the to welcome"

#QA
'''
Given an input string, containing upper-case and lower-case letters, digits, and spaces( ' ' ).
A word is defined as a sequence of non-space characters. The words in s are separated by at least one space. Return a string with the words in reverse order, concatenated by a single space.

Examples
Input: s = "welcome to the jungle"
Output: "jungle the to welcome"
Explanation: The words in the input string are "welcome", "to", "the", and "jungle". Reversing the order of these words gives "jungle", "the", "to", and "welcome". The output string should have exactly one space between each word.

Input: s = " amazing coding skills "
Output: "skills coding amazing"
Explanation: The input string has leading and trailing spaces, as well as multiple spaces between the words "amazing", "coding", and "skills". After trimming the leading and trailing spaces and reducing the multiple spaces between words to a single space, the words are "amazing", "coding", and "skills". Reversing the order of these words gives "skills", "coding", and "amazing". The output string should not have any leading or trailing spaces and should have exactly one space between each word.

You are the owner of a Shipment company. You use conveyor belts to ship packages from one port to another. The packages must be shipped within 'd' days. The weights of the packages are given in an array 'of weights'. The packages are loaded on the conveyor belts every day in the same order as they appear in the array. The loaded weights must not exceed the maximum weight capacity of the ship. Find out the least-weight capacity so that you can ship all the packages within 'd' days .

vars:
d = day
W = [ ]
WC = 0

Examples

Input: N = 5, weights = [5, 4, 5, 2, 3, 4, 5, 6], d = 5
Output: 9
Explanation: The minimum ship capacity needed to ship all packages within 5 days is 9.

Input: N = 3, weights = [1, 2, 3, 4, 5], d = 2
Output: 9
Explanation: With a capacity of 9, the packages can be shipped in 2 days as [1,2,3,4] and [5].


Given an integer array nums, find the contiguous subarray with the largest sum and return its sum.

Example:

Input: [-2,1,-3,4,-1,2,1,-5,4]

- (2 + 3 + 1 + 5 ) + 1 + 4 + 2 + 1 + 4

- 11 + 12


-3, -2, -1, 1, 2, 

- (3 + 2 + 1) + 1 + 2 = - 6 + 3

Output: 6

Explanation:
[4,-1,2,1] has the largest sum = 6.


4 + (-1) + 2 + 1 = 6

'''
