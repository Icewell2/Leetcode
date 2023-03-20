2388. Change Null Values in a Table to the Previous Value

Create table If Not Exists CoffeeShop (id int, drink varchar(20))
Truncate table CoffeeShop
insert into CoffeeShop (id, drink) values ('9', 'Mezcal Margarita')
insert into CoffeeShop (id, drink) values ('6', 'None')
insert into CoffeeShop (id, drink) values ('7', 'None')
insert into CoffeeShop (id, drink) values ('3', 'Americano')
insert into CoffeeShop (id, drink) values ('1', 'Daiquiri')
insert into CoffeeShop (id, drink) values ('2', 'None')


Table: CoffeeShop

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| drink       | varchar |
+-------------+---------+
id is the primary key for this table.
Each row in this table shows the order id and the name of the drink ordered. Some drink rows are nulls.

 

Write an SQL query to replace the null values of drink with the name of the drink of the previous row that is not null. It is guaranteed that the drink of the first row of the table is not null.

Return the result table in the same order as the input.

The query result format is shown in the following example.

 

Example 1:

Input: 
CoffeeShop table:
+----+------------------+
| id | drink            |
+----+------------------+
| 9  | Mezcal Margarita |
| 6  | null             |
| 7  | null             |
| 3  | Americano        |
| 1  | Daiquiri         |
| 2  | null             |
+----+------------------+
Output: 
+----+------------------+
| id | drink            |
+----+------------------+
| 9  | Mezcal Margarita |
| 6  | Mezcal Margarita |
| 7  | Mezcal Margarita |
| 3  | Americano        |
| 1  | Daiquiri         |
| 2  | Daiquiri         |
+----+------------------+
Explanation: 
For ID 6, the previous value that is not null is from ID 9. We replace the null with "Mezcal Margarita".
For ID 7, the previous value that is not null is from ID 9. We replace the null with "Mezcal Margarita".
For ID 2, the previous value that is not null is from ID 1. We replace the null with "Daiquiri".
Note that the rows in the output are the same as in the input.

# Write your MySQL query statement below
# @rnotappl

WITH cte AS(
SELECT
    *,
    ROW_NUMBER() OVER() AS rnk
FROM CoffeeShop
), cte2 AS(
SELECT 
    *,
    COUNT(drink) OVER(ORDER BY rnk) as counter
FROM cte
)

SELECT 
    id,
    FIRST_VALUE(drink) OVER(PARTITION BY counter) AS drink
FROM cte2

;
