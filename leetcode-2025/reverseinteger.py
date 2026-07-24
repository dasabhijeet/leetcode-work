# Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.
# Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

'''
Example 1:

Input: x = 123
Output: 321
Example 2:

Input: x = -123
Output: -321
Example 3:

Input: x = 120
Output: 21

Constraints:

-231 <= x <= 231 - 1
'''

class Solution:
    def reverse(self, x: int) -> int:
        
        if -2**31 <= x <= 2**31 - 1:
            
            x_marker = x
            x = abs(x)
            dict1 = []

            if x == 0:
                return 0
            
            while(x>0):
                num = x%10
                x = x//10
                dict1.append(num)
                
            dict1_num = int("".join(str(n) for n in dict1))
            
            if x_marker < 0:
                dict1_num = - dict1_num
            
            if dict1_num > 2**31 - 1 or dict1_num < -2**31:
                return 0

            return dict1_num
        
        else:
            return 0

obj = Solution()
obj.reverse(-4684)
