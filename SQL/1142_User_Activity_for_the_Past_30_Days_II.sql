Create table If Not Exists Activity (user_id int, session_id int, activity_date date, activity_type ENUM('open_session', 'end_session', 'scroll_down', 'send_message'))
Truncate table Activity
insert into Activity (user_id, session_id, activity_date, activity_type) values ('1', '1', '2019-07-20', 'open_session')
insert into Activity (user_id, session_id, activity_date, activity_type) values ('1', '1', '2019-07-20', 'scroll_down')
insert into Activity (user_id, session_id, activity_date, activity_type) values ('1', '1', '2019-07-20', 'end_session')
insert into Activity (user_id, session_id, activity_date, activity_type) values ('2', '4', '2019-07-20', 'open_session')
insert into Activity (user_id, session_id, activity_date, activity_type) values ('2', '4', '2019-07-21', 'send_message')
insert into Activity (user_id, session_id, activity_date, activity_type) values ('2', '4', '2019-07-21', 'end_session')
insert into Activity (user_id, session_id, activity_date, activity_type) values ('3', '2', '2019-07-21', 'open_session')
insert into Activity (user_id, session_id, activity_date, activity_type) values ('3', '2', '2019-07-21', 'send_message')
insert into Activity (user_id, session_id, activity_date, activity_type) values ('3', '2', '2019-07-21', 'end_session')
insert into Activity (user_id, session_id, activity_date, activity_type) values ('3', '5', '2019-07-21', 'open_session')
insert into Activity (user_id, session_id, activity_date, activity_type) values ('3', '5', '2019-07-21', 'scroll_down')
insert into Activity (user_id, session_id, activity_date, activity_type) values ('3', '5', '2019-07-21', 'end_session')
insert into Activity (user_id, session_id, activity_date, activity_type) values ('4', '3', '2019-06-25', 'open_session')
insert into Activity (user_id, session_id, activity_date, activity_type) values ('4', '3', '2019-06-25', 'end_session')

Table: Activity

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| session_id    | int     |
| activity_date | date    |
| activity_type | enum    |
+---------------+---------+
There is no primary key for this table, it may have duplicate rows.
The activity_type column is an ENUM of type ('open_session', 'end_session', 'scroll_down', 'send_message').
The table shows the user activities for a social media website. 
Note that each session belongs to exactly one user.

 

Write an SQL query to find the average number of sessions per user for a period of 30 days ending 2019-07-27 inclusively, rounded to 2 decimal places. The sessions we want to count for a user are those with at least one activity in that time period.

The query result format is in the following example.

 

Example 1:

Input: 
Activity table:
+---------+------------+---------------+---------------+
| user_id | session_id | activity_date | activity_type |
+---------+------------+---------------+---------------+
| 1       | 1          | 2019-07-20    | open_session  |
| 1       | 1          | 2019-07-20    | scroll_down   |
| 1       | 1          | 2019-07-20    | end_session   |
| 2       | 4          | 2019-07-20    | open_session  |
| 2       | 4          | 2019-07-21    | send_message  |
| 2       | 4          | 2019-07-21    | end_session   |
| 3       | 2          | 2019-07-21    | open_session  |
| 3       | 2          | 2019-07-21    | send_message  |
| 3       | 2          | 2019-07-21    | end_session   |
| 3       | 5          | 2019-07-21    | open_session  |
| 3       | 5          | 2019-07-21    | scroll_down   |
| 3       | 5          | 2019-07-21    | end_session   |
| 4       | 3          | 2019-06-25    | open_session  |
| 4       | 3          | 2019-06-25    | end_session   |
+---------+------------+---------------+---------------+
Output: 
+---------------------------+ 
| average_sessions_per_user |
+---------------------------+ 
| 1.33                      |
+---------------------------+
Explanation: User 1 and 2 each had 1 session in the past 30 days while user 3 had 2 sessions so the average is (1 + 1 + 2) / 3 = 1.33.



SOl:

# Write your MySQL query statement below
/*
-- SELECT ROUND(AVG(activity_type),2) AS average_sessions_per_user
SELECT activity_type AS average_sessions_per_user
FROM Activity
WHERE activity_type = (
    SELECT activity_type
    FROM Activity
    WHERE  activity_type = 'open_session'
    GROUP BY user_id
    ) AND
    activity_date > 2019-06-27 AND activity_date < 2019-07-27
-- GROUP BY user_id
;
*/

/*
    SELECT SUM(activity_type)
    FROM Activity
    WHERE  activity_type = 'open_session'
        AND activity_date > '2019-06-27' AND activity_date < '2019-07-27'
    GROUP BY user_id
    */
/*
SELECT -- ROUND(AVG(average_sessions_per_user),2) AS average_sessions_per_user,
CASE 
    WHEN ROUND(AVG(average_sessions_per_user),2) IS NULL THEN 0
    ELSE ROUND(AVG(average_sessions_per_user),2) 
END AS average_sessions_per_user
FROM
(
SELECT COUNT(activity_type) AS average_sessions_per_user
FROM Activity
WHERE activity_type = 'open_session' AND activity_date > '2019-06-27' AND activity_date < '2019-07-28'
GROUP BY user_id
) AS temp
;
*/

SELECT ifnull(ROUND(COUNT(DISTINCT session_id)/COUNT(DISTINCT user_id), 2),0.00) 
AS average_sessions_per_user
FROM Activity 
WHERE activity_date >= '2019-06-28' and activity_date <= '2019-07-27';  



