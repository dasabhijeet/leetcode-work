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
