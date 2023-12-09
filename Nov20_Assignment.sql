NAME: ABHIJEET PAWAR


Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.

mysql> SELECT FIRST_NAME AS WORKER_NAME FROM WORKER;
+-------------+
| WORKER_NAME |
+-------------+
| Monika      |
| Niharika    |
| Vishal      |
| Amitabh     |
| Vivek       |
| Vipul       |
| Satish      |
| Geetika     |
+-------------+

Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
mysql> SELECT UPPER(FIRST_NAME) FROM WORKER;
+-------------------+
| UPPER(FIRST_NAME) |
+-------------------+
| MONIKA            |
| NIHARIKA          |
| VISHAL            |
| AMITABH           |
| VIVEK             |
| VIPUL             |
| SATISH            |
| GEETIKA           |
+-------------------+

Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
 
mysql> SELECT DISTINCT(DEPARTMENT) FROM WORKER;
+------------+
| DEPARTMENT |
+------------+
| HR         |
| Admin      |
| Account    |
+------------+

Q-4. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.

mysql> SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) FROM WORKER;
+----------------------------------+
| CONCAT(FIRST_NAME,' ',LAST_NAME) |
+----------------------------------+
| Monika Arora                     |
| Niharika Verma                   |
| Vishal Singhal                   |
| Amitabh Singh                    |
| Vivek Bhati                      |
| Vipul Diwan                      |
| Satish Kumar                     |
| Geetika Chauhan                  |
+----------------------------------+

Q-5. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

mysql> SELECT * FROM WORKER ORDER BY FIRST_NAME ;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
8 rows in set (0.00 sec)


Q-6. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

mysql> SELECT * FROM WORKER ORDER BY FIRST_NAME AND DEPARTMENT DESC;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
8 rows in set, 8 warnings (0.00 sec)

Q-7. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

mysql> SELECT * FROM WORKER WHERE FIRST_NAME IN ('VIPUL','SATISH');
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
+-----------+------------+-----------+--------+---------------------+------------+
2 rows in set (0.00 sec)

Q-8. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.

mysql> SELECT * FROM WORKER WHERE FIRST_NAME NOT IN ('VIPUL','SATISH');
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
6 rows in set (0.00 sec)

Q-9. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.

mysql> SELECT * FROM WORKER WHERE DEPARTMENT ='ADMIN';
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |


|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
4 rows in set (0.00 sec)

Q-10. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

mysql> SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%a%';
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
6 rows in set (0.00 sec)


Q-11. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

mysql> SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%a%';
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
6 rows in set (0.00 sec)

Q-12. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

mysql> SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%h';
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
+-----------+------------+-----------+--------+---------------------+------------+
2 rows in set (0.00 sec)


Q-13. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
 

mysql> SELECT * FROM WORKER WHERE SALARY  BETWEEN 100000 AND 500000;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
+-----------+------------+-----------+--------+---------------------+------------+
5 rows in set (0.00 sec)

Q-14. Write an SQL query to print details of the Workers who have joined in Feb’2014.

mysql> SELECT * FROM WORKER WHERE JOINING_DATE LIKE '2014-02%';
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
3 rows in set (0.00 sec


Q-15. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

mysql> SELECT COUNT(*) FROM WORKER WHERE DEPARTMENT ='ADMIN';
+----------+
| COUNT(*) |
+----------+
|        4 |
+----------+
1 row in set (0.00 sec)

Q-16. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.

mysql> SELECT * FROM WORKER WHERE SALARY BETWEEN 50000 AND 100000;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
4 rows in set (0.00 sec)

Q-17. Write an SQL query to fetch the no. of workers for each department in the descending order.

mysql> SELECT DEPARTMENT, COUNT(*) AS WORKER_COUNT  FROM WORKER GROUP  BY DEPARTMENT ORDER BY WORKER_COUNT DESC;
+------------+--------------+
| DEPARTMENT | WORKER_COUNT |
+------------+--------------+
| Admin      |            4 |
| HR         |            2 |
| Account    |            2 |
+------------+--------------+
3 rows in set (0.00 sec)


Q-18. Write an SQL query to print details of the Workers who are also Managers.

mysql> SELECT * FROM WORKER INNER JOIN TITLE ON WORKER.WORKER_ID = TITLE.WORKER_REF_ID WHERE TITLE.WORKER_TITLE ='MANAGER';
+-----------+------------+-----------+--------+---------------------+------------+---------------+--------------+---------------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT | WORKER_REF_ID | WORKER_TITLE | AFFECTED_FROM       |
+-----------+------------+-----------+--------+---------------------+------------+---------------+--------------+---------------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |             1 | Manager      | 2016-02-20 00:00:00 |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |             5 | Manager      | 2016-06-11 00:00:00 |
+-----------+------------+-----------+--------+---------------------+------------+---------------+--------------+---------------------+
2 rows in set (0.00 sec)

Q-19. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

 mysql> SELECT * FROM Worker w1, Worker w2 WHERE w1.WORKER_ID < w2.WORKER_ID AND w1.FIRST_NAME = w2.FIRST_NAME AND w1.LAST_NAME = w2.LAST_NAME;
Empty set (0.00 sec)

Q-20. Write an SQL query to show only odd rows from a table.


mysql> SELECT * FROM WORKER  WHERE WORKER_ID % 2 != 0;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
+-----------+------------+-----------+--------+---------------------+------------+
4 rows in set (0.00 sec)



























