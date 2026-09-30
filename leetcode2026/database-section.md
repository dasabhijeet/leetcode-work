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

ANSWER:

select Employee.name as Employee from Employee join Employee as managerTable on Employee.managerId = managerTable.id where Employee.salary > managerTable.salary;

select Employee.name as Employee from Employee inner join Employee as managerTable on Employee.managerId = managerTable.id where Employee.salary > managerTable.salary;

Hint: This is basically inner join (default join) on replica of the given table with a comparison operator.
