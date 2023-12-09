
Name: Abhijeet Pawar
Q-1. Write an SQL query to determine the nth (say n=5) highest salary from a table.

 select distinct salary from worker order by salary desc limit 1 offset 4 ;
+--------+
| salary |
+--------+
|  90000 |
+--------+
 
Q-2. Write an SQL query to determine the 5th highest salary without using TOP or limit method.

 select * from(
    -> select salary ,
    -> dense_rank() over(order by salary desc)dr
    -> from worker )as w
    -> where dr=5;
+--------+----+
| salary | dr |
+--------+----+
|  90000 |  5 |
+--------+----+
 
Q-3. Write an SQL query to fetch the list of employees with the same salary table.

 select w1.first_name ,w1.last_name, w1.salary from worker w1 inner join worker w2 on w1.salary=w2.salary and w1.worker_id<>w2.worker_id;
+------------+-----------+--------+


| first_name | last_name | salary |
+------------+-----------+--------+
| Vivek      | Bhati     | 500000 |
| Amitabh    | Singh     | 500000 |
+------------+-----------+--------+

 select *
    -> from worker
    -> where salary in
    -> (select salary from worker w
    -> where worker.worker_id<>w.worker_id);
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+

Q-4. Write an SQL query to show one row twice in results from worker table.

select * from worker w union all select * from worker e order by worker_id;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
 
Q-5. Write an SQL query to fetch the first 50% records from worker table.

select * from worker where worker_id <= (select max(worker_id)/2 from worker);
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
 
Q-6. Write an SQL query to fetch the departments that have less than five people in it.

select department,count(*) no_of_emp from worker group by department having no_of_emp<5;
+------------+-----------+
| department | no_of_emp |
+------------+-----------+
| HR         |         2 |
| Admin      |         4 |
| Account    |         2 |
+------------+-----------+ 

Q-7. Write an SQL query to show all departments along with the number of people in there.
 
select department,count(*) from worker group by department;
+------------+----------+
| department | count(*) |
+------------+----------+
| HR         |        2 |
| Admin      |        4 |
| Account    |        2 |
+------------+----------+

Q-8. Write an SQL query to show the last record from worker table.

select * from worker where (select worker_id )order by worker_id desc limit 1;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+

select * from worker where worker_id =(select max(worker_id) from worker);
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+

Q-9. Write an SQL query to fetch the first row of a worker  table.

select * from worker where(select min(worker_id) from worker)limit 1;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
+-----------+------------+-----------+--------+---------------------+------------+

select * from worker limit 1;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
+-----------+------------+-----------+--------+---------------------+------------+

Q-10. Write an SQL query to fetch the last five records from worker table.

 select * from(select * from worker order by worker_id desc limit 5)s order by worker_id;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+

select * from worker where (select worker_id )order by worker_id desc limit 5;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+ 

Q-11. Write an SQL query to print the name of employees having the highest salary in each department.

select * from (select *,dense_rank() over(partition by department order by salary desc)max_salary from worker)as t where max_salary=1;
+-----------+------------+-----------+--------+---------------------+------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT | max_salary |
+-----------+------------+-----------+--------+---------------------+------------+------------+
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |          1 |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |          1 |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |          1 |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |          1 |
+-----------+------------+-----------+--------+---------------------+------------+------------+

Q-12. Write an SQL query to fetch three max salaries from a table.

select * from(select * from worker order by salary desc limit 3)s ;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
+-----------+------------+-----------+--------+---------------------+------------+
 
Q-13. Write an SQL query to fetch three min salaries from a table.

 select * from(select * from worker order by salary limit 3)s ;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
 
Q-14. Write an SQL query to fetch nth max salaries from a table.

select * from(select * from worker order by salary desc limit 5)s order by worker_id;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
+-----------+------------+-----------+--------+---------------------+------------+
 
Q-15. Write an SQL query to fetch departments along with the total salaries paid for each of them.

select DEPARTMENT , sum(salary) TOTAL_SALARY from worker group by department;
+------------+--------------+
| DEPARTMENT | TOTAL_SALARY |
+------------+--------------+
| HR         |       400000 |
| Admin      |      1170000 |
| Account    |       275000 |
+------------+--------------+
