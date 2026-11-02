'''
QUESTION (IMPORTANT PROBLEM):

Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

You must implement a solution with a linear runtime complexity and use only constant extra space.

Example 1:

Input: nums = [2,2,1]

Output: 1

Example 2:

Input: nums = [4,1,2,1,2]

Output: 4

Example 3:

Input: nums = [1]

Output: 1
'''

# Solution 1 (Correct but facing TLE error due to nested for loops):

class Solution:
    def singleNumber(self, nums: list[int]) -> int:
        count = 0
        for x in range(0,len(nums),1):
            for y in range(0,len(nums),1):
                if nums[x] == nums[y]:
                    count = count + 1
            #print(count)
            if count != 1:
                count = 0
                continue
            else:
                count = 0
                return f"Answer: {nums[x]}"


arr1 = [2,2,1]

sol = Solution()
print(sol.singleNumber(arr1))


# Solution 2 (Correct and Accepted Solution):

class Solution:
    def singleNumber(self, nums: list[int]) -> int:

        count = 0
        for x in range(0,len(nums),1):
            count = nums.count(nums[x])   # nested for loop removed and replaced by count()
            if count != 1:
                count = 0
                continue
            else:
                count = 0
                return f"Answer: {nums[x]}"

		
arr1 = [2,2,1]

sol = Solution()
print(sol.singleNumber(arr1))


# Solution 3 (XOR Method and Fastest):

#XOR LOGIC:
#Truth table: 0 ^ 0 = 0 | 0 ^ 1 = 1 | 1 ^ 0 = 1 | 1 ^ 1 = 0
#Order doesn't matter: a ^ b = b ^ a (Commutative Property).

'''
How it works out:
(2 ^ 2) ^ 1

= 0 ^ 1

= 1
'''

class Solution:
    def singleNumber(self, nums: list[int]) -> int:
        result = 0
        for x in nums:
            result = result ^ x
        return result

		
arr1 = [2,2,1]

sol = Solution()
print(sol.singleNumber(arr1))

# END
