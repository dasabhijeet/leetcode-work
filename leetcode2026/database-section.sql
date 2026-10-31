30 Sept 2026

#1

Input: 
Person table:
+----------+----------+-----------+
| personId | lastName | firstName |
+----------+----------+-----------+
| 1        | Wang     | Allen     |
| 2        | Alice    | Bob       |
+----------+----------+-----------+
Address table:
+-----------+----------+---------------+------------+
| addressId | personId | city          | state      |
+-----------+----------+---------------+------------+
| 1         | 2        | New York City | New York   |
| 2         | 3        | Leetcode      | California |
+-----------+----------+---------------+------------+
Output: 
+-----------+----------+---------------+----------+
| firstName | lastName | city          | state    |
+-----------+----------+---------------+----------+
| Allen     | Wang     | Null          | Null     |
| Bob       | Alice    | New York City | New York |
+-----------+----------+---------------+----------+

ANSWER:

# Write your MySQL query statement below
select Person.firstName, Person.lastName, Address.city, Address.state from Address right join Person on Person.personId=Address.personId;

Hint: Learn about left join, right join, etc. Learn all types of JOIN statements.



#2

Input: 
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+
Explanation: Joe is the only employee who earns more than his manager.

ANSWER (correct answer below, row 59 and 61):

select Employee.name as Employee from Employee join Employee as managerTable on Employee.managerId = managerTable.id where Employee.salary > managerTable.salary;

select Employee.name as Employee from Employee inner join Employee as managerTable on Employee.managerId = managerTable.id where Employee.salary > managerTable.salary;

Somewhat correct answer but actually wrong:

select name as Employee from Employee where ((select salary from Employee where managerId is not null limit 1)>(select salary from Employee where managerId is null limit 1)) limit 1;

Hint: This is basically inner join (default join) on replica of the given table with a comparison operator.



#3

# Customers Who Never Order

Input: 
Customers table:
+----+-------+
| id | name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
Orders table:
+----+------------+
| id | customerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
Output: 
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+


CORRECT ANSWER:

SELECT Customers.name AS Customers FROM Customers LEFT JOIN Orders ON Customers.id = Orders.id WHERE Customers.id NOT IN (SELECT Orders.customerId FROM Orders);
  
WRONG ANSWER, BUT NEARLY CORRECT:

SELECT Customers.name AS Customers FROM Customers INNER JOIN Orders ON Customers.id = Orders.id WHERE Customers.id NOT IN (SELECT Orders.customerId FROM Orders);

Lesson: Use venn diagram to visualize the join statements.


-- Question 4

Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.
 

Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.

For Pandas users, please note that you are supposed to modify Person in place.

After running your script, the answer shown is the Person table. The driver will first compile and run your piece of code and then show the Person table. The final order of the Person table does not matter.

The result format is in the following example.

 

Example 1:

Input: 
Person table:
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Output: 
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
Explanation: john@example.com is repeated two times. We keep the row with the smallest Id = 1.


ANSWER:

# Write your MySQL query statement below

DELETE DuplicateRecord FROM Person AS DuplicateRecord INNER JOIN Person AS KeepRecord ON DuplicateRecord.email = KeepRecord.email AND DuplicateRecord.id > KeepRecord.id;

-- Hint/working logic: Inner join same table alias, then compare the id and only delete those having higher id value.

# Much more efficient and logical: Solution 2:

DELETE FROM Person WHERE id NOT IN (SELECT id FROM (SELECT MIN(id) AS id FROM Person GROUP BY email) AS BackupTable);

Working logic: Inner most subquery 'GROUP BY' groups all identical rows and also 'MIN' function returns smallest value, i.e. first occurence. At the same time, it creates
a new id column alias using 'AS'. Then it also creates a new temporary table alias using 'AS'. Only then 'SELECT id FROM' subquery starts working. Because this entire subquery 
section only sorts the first occurence and produces them properly via aliases, the DELETE query can simply delete all occurences except first occurence. Hence it works.

-- Q4 is fairly tricky yet presented as if its simple.


-- QUESTION 5 (Fairly Tricky and NOT EASY, unlike written in Leetcode!):

Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.
 

Write a solution to find all dates id with higher temperatures compared to its previous calendar dates (yesterday).

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+
Explanation: 
In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
In 2015-01-04, the temperature was higher than the previous day (20 -> 30).


ANSWER:

# Write your MySQL query statement below

SELECT TodayTableAlias.id AS id FROM Weather AS TodayTableAlias JOIN Weather AS YesterdayTableAlias ON DATEDIFF(TodayTableAlias.recordDate, YesterdayTableAlias.recordDate) = 1 WHERE TodayTableAlias.temperature > YesterdayTableAlias.temperature;

SELECT TodayTableAlias.id AS id FROM Weather AS TodayTableAlias INNER JOIN Weather AS YesterdayTableAlias ON DATEDIFF(TodayTableAlias.recordDate, YesterdayTableAlias.recordDate) = 1 WHERE TodayTableAlias.temperature > YesterdayTableAlias.temperature;

-- This question is fairly tricky. Learn DATEDIFF and SELFJOIN deeply. Some memorization may be needed if logic is not working for the moment. Also teaches that INNER JOIN = JOIN. Same thing.


-- QUESTION 5:

Product Sales Analysis I

Table: Sales

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
(sale_id, year) is the primary key (combination of columns with unique values) of this table.
product_id is a foreign key (reference column) to Product table.
Each row of this table shows a sale on the product product_id in a certain year.
Note that the price is per unit.
 

Table: Product

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+
product_id is the primary key (column with unique values) of this table.
Each row of this table indicates the product name of each product.
 

Write a solution to report the product_name, year, and price for each sale_id in the Sales table.

Return the resulting table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+ 
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+
Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+
Output: 
+--------------+-------+-------+
| product_name | year  | price |
+--------------+-------+-------+
| Nokia        | 2008  | 5000  |
| Nokia        | 2009  | 5000  |
| Apple        | 2011  | 9000  |
+--------------+-------+-------+
Explanation: 
From sale_id = 1, we can conclude that Nokia was sold for 5000 in the year 2008.
From sale_id = 2, we can conclude that Nokia was sold for 5000 in the year 2009.
From sale_id = 7, we can conclude that Apple was sold for 9000 in the year 2011.



# Solution 1:

SELECT Product.product_name, Sales.year, Sales.price FROM Product INNER JOIN Sales WHERE Product.product_id = Sales.product_id;

# Solution 2:
SELECT Product.product_name AS product_name, Sales.year AS year, Sales.price as price FROM Product JOIN Sales ON Product.product_id = Sales.product_id;

Tip: WHERE works too, in place of ON. (not sure true by theory)


-- QUESTION 6:

Bank Account Summary II
Solved
Easy
Topics
premium lock icon
Companies
SQL Schema
Pandas Schema
Table: Users

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| account      | int     |
| name         | varchar |
+--------------+---------+
account is the primary key (column with unique values) for this table.
Each row of this table contains the account number of each user in the bank.
There will be no two users having the same name in the table.
 

Table: Transactions

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| trans_id      | int     |
| account       | int     |
| amount        | int     |
| transacted_on | date    |
+---------------+---------+
trans_id is the primary key (column with unique values) for this table.
Each row of this table contains all changes made to all accounts.
amount is positive if the user received money and negative if they transferred money.
All accounts start with a balance of 0.
 

Write a solution to report the name and balance of users with a balance higher than 10000. The balance of an account is equal to the sum of the amounts of all transactions involving that account.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Users table:
+------------+--------------+
| account    | name         |
+------------+--------------+
| 900001     | Alice        |
| 900002     | Bob          |
| 900003     | Charlie      |
+------------+--------------+
Transactions table:
+------------+------------+------------+---------------+
| trans_id   | account    | amount     | transacted_on |
+------------+------------+------------+---------------+
| 1          | 900001     | 7000       |  2020-08-01   |
| 2          | 900001     | 7000       |  2020-09-01   |
| 3          | 900001     | -3000      |  2020-09-02   |
| 4          | 900002     | 1000       |  2020-09-12   |
| 5          | 900003     | 6000       |  2020-08-07   |
| 6          | 900003     | 6000       |  2020-09-07   |
| 7          | 900003     | -4000      |  2020-09-11   |
+------------+------------+------------+---------------+
Output: 
+------------+------------+
| name       | balance    |
+------------+------------+
| Alice      | 11000      |
+------------+------------+
Explanation: 
Alice balance is (7000 + 7000 - 3000) = 11000.
Bob's balance is 1000.
Charlie's balance is (6000 + 6000 - 4000) = 8000.

Solution 1:

SELECT Users.name AS NAME, SUM(Transactions.amount) AS BALANCE FROM Users 
JOIN Transactions ON Users.account = Transactions.account
GROUP BY Transactions.account
HAVING SUM(Transactions.amount)>10000;

Solution 2:

SELECT NAME, BALANCE FROM (SELECT Users.name AS NAME, SUM(Transactions.amount) AS BALANCE FROM Users 
JOIN Transactions ON Users.account = Transactions.account
GROUP BY Transactions.account) AS ResultTableAlias WHERE BALANCE > 10000;

