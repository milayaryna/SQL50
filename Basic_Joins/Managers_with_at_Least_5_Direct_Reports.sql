-- Managers with at Least 5 Direct Reports

/*
Write a solution to find managers with at least five direct reports.

Return the result table in any order.

The result format is in the following example.


Example 1:

Input: 
Employee table:
+-----+-------+------------+-----------+
| id  | name  | department | managerId |
+-----+-------+------------+-----------+
| 101 | John  | A          | null      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |
+-----+-------+------------+-----------+
Output: 
+------+
| name |
+------+
| John |
+------+
*/

select A.name
from Employee A
left join Employee B on A.id = B.managerId
group by A.id
having count(B.name) >= 5
-- Having 用來取代 Where 進行條件查詢，因為 Where 不能與 aggregate function 一起使用。
