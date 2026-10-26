'''
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation:
The sum of nums[0] and nums[1] is 2 + 7 = 9, which equals the target. Therefore, the indices [0, 1] are returned.
'''

class Solution:
    def twoSum(self, nums: list[int], target: int) -> list[int]:

        for i in range(0,len(nums),1):
            for j in range(i + 1, len(nums),1):

                if nums[i] + nums[j] == target:
                    return [i, j]
                else:
                    continue

            #print(n1)
            #print(n2)

            #n1,n2 = [],[]

data1 = [2,7,11,15]
data2 = 9

sol = Solution()
print(sol.twoSum(data1,data2))       
