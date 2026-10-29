'''
Write an algorithm to determine if a number n is happy.

A happy number is a number defined by the following process:

Starting with any positive integer, replace the number by the sum of the squares of its digits.
Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
Those numbers for which this process ends in 1 are happy.
Return true if n is a happy number, and false if not.

Example 1:

Input: n = 19
Output: true
Explanation:
12 + 92 = 82
82 + 22 = 68
62 + 82 = 100
12 + 02 + 02 = 1
Example 2:

Input: n = 2
Output: false

Constraints:

1 <= n <= 231 - 1

'''

# SOLUTION 1

class Solution:
    def isHappy(self, n: int) -> bool:

        if n < 1 or n > 2**31 - 1:
            return False

        seen = set()
        while True:

            digits = []
            while n > 0:
                digit = n % 10
                digits.append(digit)
                n = n // 10

            new_num = 0

            for x in range(0,len(digits),1):

                new_num = new_num + (digits[x]*digits[x])

            if new_num == 1:
                return True
            elif new_num in seen:
                return False
            else:
                n = new_num
                seen.add(new_num)


inp = int(input("Enter an integer: "))
sol = Solution()
print(sol.isHappy(inp))


# SOLUTION 2

class Solution:
    def isHappy(self, n: int) -> bool:

        if n < 1 or n > 2**31 - 1:
            return False

        counter = 0

        while counter < 100:

            digits = []
            while n > 0:
                digit = n % 10
                digits.append(digit)
                n = n // 10

            new_num = 0

            for x in range(0,len(digits),1):

                new_num = new_num + (digits[x]*digits[x])

            #print(new_num)
          
            if new_num == 1:
                return True
            elif new_num in seen:
                return False
            else:
                seen.add(new_num)
                n = new_num


inp = int(input("Enter an integer: "))
sol = Solution()
print(sol.isHappy(inp))


# SOLUTION 3

class Solution:
    def isHappy(self, n: int) -> bool:

        if n < 1 or n > 2**31 - 1:
            return False

        counter = 0

        while counter < 100:

            digits = []
            while n > 0:
                digit = n % 10
                digits.append(digit)
                n = n // 10

            new_num = 0

            for x in range(0,len(digits),1):

                new_num = new_num + (digits[x]*digits[x])

            #print(new_num)

            if new_num == 1:
                return True
            elif new_num != 1:
                counter = counter + 1
                n = new_num
            
            if counter > 99:
                return False


inp = int(input("Enter an integer: "))
sol = Solution()
print(sol.isHappy(inp))

#repo: https://github.com/dasabhijeet/leetcode-work
