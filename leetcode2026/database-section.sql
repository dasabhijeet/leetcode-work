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

-- Hint: Inner join same table, then compare the id and only delete those having higher id value.
