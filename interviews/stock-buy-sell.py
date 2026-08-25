'''

Given an array prices[] of non-negative integers, representing the prices of the stocks on different days,
return the maximum profit possible by buying and selling the stocks on different days when at most one transaction is allowed.
Here one transaction means 1 buy + 1 Sell. If it is not possible to make a profit then return 0.

Note: Stock must be bought before being sold.

Examples:

Input: prices[] = [7, 10, 1, 3, 6, 9, 2]
Output: 8
Explanation: Buy for price 1 and sell for price 9. 

Input: prices[] = [7, 6, 4, 3, 1]
Output: 0
Explanation: Since the array is sorted in decreasing order, 0 profit can be made without making any transaction.

Input: prices[] = [1, 3, 6, 9, 11]
Output: 10
Explanation: Since the array is sorted in increasing order, we can make maximum profit by buying at price[0] and selling at price[n-1]

'''

class Stocks():
  
    def StockCalc(self, p):
        
        l = len(p)
        max_profit = 0
        
        for x in range(l):
            for y in range(x + 1, l):
                
                if p[y] > p[x]:
                    profit = p[y] - p[x]
                    
                    if profit > max_profit:
                        max_profit = profit
        
        return max_profit


arr1 = [7, 6, 4, 3, 1, 5, 12, 11, 50]

obj = Stocks()
print(obj.StockCalc(arr1))
