class Solution(object):

    # Get alphabet position

    def getAlphaPosition(self, a):
        alphabets = "abcdefghijklmnopqrstuvwxyz"
        c=0
        for x in alphabets:
            c=c+1
            if x == a:
                break
        return c

    # Perform score balance

    def scoreBalance(self, s):

        # initial checks / constraints

        if len(s) < 2 or len(s) > 100:
            return False

        for char in s:
            if char < 'a' or char > 'z':
                return False

        # continuously slice the string at every index
        # and make a set of left vs right characters

        for i in range(1,len(s)):
            left = s[:i]
            right = s[i:]

            # initialize values

            left_char_sum = 0
            right_char_sum = 0

            # for that specific left and right set, add up their position values on each side

            for l in range(len(left)):
                left_char = left[l]
                left_char_sum = left_char_sum + self.getAlphaPosition(left_char)

            for r in range(len(right)):
                right_char = right[r]
                right_char_sum = right_char_sum + self.getAlphaPosition(right_char)

            # validate whether left sum = right sum. Then return True, else out of loop, return False

            if left_char_sum == right_char_sum:
                return True
            
        return False
        
s = "bcad"
obj = Solution()
print(obj.scoreBalance(s))

# https://github.com/dasabhijeet
# 14 August 2026
