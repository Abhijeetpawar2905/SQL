select * from salespeople;
+------+---------+-----------+------+
| SNUM | SNAME   | CITY      | COMM |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.13 |
| 1003 | AxelRod | New York  | 0.10 |
| 1004 | Motika  | London    | 0.11 |
| 1005 | Fran    | London    | 0.26 |
| 1007 | Rifkin  | Barcelona | 0.15 |
+------+---------+-----------+------+
 select * from customers;
+------+----------+----------+--------+------+
| CNUM | CNAME    | CITY     | RATING | SNUM |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   |    100 | 1001 |
| 2002 | Giovanni | Rome     |    200 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2006 | Clemens  | London   |    100 | 1001 |
| 2007 | Pereira  | Rome     |    100 | 1004 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+
 select * from orders;
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1996-10-03 | 2008 | 1007 |
| 3002 | 1900.10 | 1996-10-03 | 2007 | 1004 |
| 3003 |  767.19 | 1996-10-03 | 2001 | 1001 |
| 3005 | 5160.45 | 1996-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1996-10-03 | 2008 | 1007 |
| 3007 |   75.75 | 1996-10-04 | 2002 | 1003 |
| 3008 | 4723.00 | 1996-10-05 | 2006 | 1001 |
| 3009 | 1713.23 | 1996-10-04 | 2002 | 1003 |
| 3010 | 1309.95 | 1996-10-06 | 2004 | 1002 |
| 3011 | 9891.88 | 1996-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+

Queries
1. List all the columns of the Salespeople table.
select * from salespeople;
+------+---------+-----------+------+
| SNUM | SNAME   | CITY      | COMM |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.13 |
| 1003 | AxelRod | New York  | 0.10 |
| 1004 | Motika  | London    | 0.11 |
| 1005 | Fran    | London    | 0.26 |
| 1007 | Rifkin  | Barcelona | 0.15 |
+------+---------+-----------+------+

2. List all customers with a rating of 100.
select * from customers where rating>100;
+------+----------+----------+--------+------+
| CNUM | CNAME    | CITY     | RATING | SNUM |
+------+----------+----------+--------+------+
| 2002 | Giovanni | Rome     |    200 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+

3. Find all records in the Customer table with NULL values in the city column.
select * from customers where city is null;
Empty set (0.00 sec)

4. Find the largest order taken by each salesperson on each date.
 select odate,o.snum,max(amt),s.* from orders o join salespeople s on s.snum=o.snum group by odate,o.snum;
+------------+------+----------+------+---------+-----------+------+
| odate      | snum | max(amt) | SNUM | SNAME   | CITY      | COMM |
+------------+------+----------+------+---------+-----------+------+
| 1996-10-03 | 1001 |   767.19 | 1001 | Peel    | London    | 0.12 |
| 1996-10-05 | 1001 |  4723.00 | 1001 | Peel    | London    | 0.12 |
| 1996-10-06 | 1001 |  9891.88 | 1001 | Peel    | London    | 0.12 |
| 1996-10-03 | 1002 |  5160.45 | 1002 | Serres  | San Jose  | 0.13 |
| 1996-10-06 | 1002 |  1309.95 | 1002 | Serres  | San Jose  | 0.13 |
| 1996-10-04 | 1003 |  1713.23 | 1003 | AxelRod | New York  | 0.10 |
| 1996-10-03 | 1004 |  1900.10 | 1004 | Motika  | London    | 0.11 |
| 1996-10-03 | 1007 |  1098.16 | 1007 | Rifkin  | Barcelona | 0.15 |
+------------+------+----------+------+---------+-----------+------+

5. Arrange the Orders table by descending customer number.
> select * from orders order by cnum desc;
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1996-10-03 | 2008 | 1007 |
| 3006 | 1098.16 | 1996-10-03 | 2008 | 1007 |
| 3002 | 1900.10 | 1996-10-03 | 2007 | 1004 |
| 3008 | 4723.00 | 1996-10-05 | 2006 | 1001 |
| 3011 | 9891.88 | 1996-10-06 | 2006 | 1001 |
| 3010 | 1309.95 | 1996-10-06 | 2004 | 1002 |
| 3005 | 5160.45 | 1996-10-03 | 2003 | 1002 |
| 3007 |   75.75 | 1996-10-04 | 2002 | 1003 |
| 3009 | 1713.23 | 1996-10-04 | 2002 | 1003 |
| 3003 |  767.19 | 1996-10-03 | 2001 | 1001 |
+------+---------+------------+------+------+

6. Find which salespeople currently have orders in the Orders table.
select s.* from (select distinct(s.snum)snum from salespeople s join orders o on o.snum=s.snum)as t join salespeople s on s.snum=t.snum;
+------+---------+-----------+------+
| SNUM | SNAME   | CITY      | COMM |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.13 |
| 1003 | AxelRod | New York  | 0.10 |
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rifkin  | Barcelona | 0.15 |
+------+---------+-----------+------+

7. List names of all customers matched with the salespeople serving them.
 select c.* from customers c join salespeople s on c.snum=s.snum;
+------+----------+----------+--------+------+
| CNUM | CNAME    | CITY     | RATING | SNUM |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   |    100 | 1001 |
| 2002 | Giovanni | Rome     |    200 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2006 | Clemens  | London   |    100 | 1001 |
| 2007 | Pereira  | Rome     |    100 | 1004 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+

8. Find the names and numbers of all salespeople who had more than one customer.
 select * from salespeople s join ( select snum from customers group by snum having count(snum)>1) as t on t.snum=s.snum;
+------+--------+----------+------+------+
| SNUM | SNAME  | CITY     | COMM | snum |
+------+--------+----------+------+------+
| 1001 | Peel   | London   | 0.12 | 1001 |
| 1002 | Serres | San Jose | 0.13 | 1002 |
+------+--------+----------+------+------+

9. Count the orders of each of the salespeople and output the results in descending order.
 select s.*,cnt from salespeople s join (select snum,count(snum)cnt from orders group by snum order by cnt desc) as t on s.snum=t.snum;
+------+---------+-----------+------+-----+
| SNUM | SNAME   | CITY      | COMM | cnt |
+------+---------+-----------+------+-----+
| 1001 | Peel    | London    | 0.12 |   3 |
| 1002 | Serres  | San Jose  | 0.13 |   2 |
| 1003 | AxelRod | New York  | 0.10 |   2 |
| 1004 | Motika  | London    | 0.11 |   1 |
| 1007 | Rifkin  | Barcelona | 0.15 |   2 |
+------+---------+-----------+------+-----+

10. List the Customer table if and only if one or more of the customers in the Customer table are located in San Jose.
 select c.* from customers c join (select city,count(city) cnt from customers group by city having cnt>1) as t on c.city=t.city where t.city='san jose';
+------+----------+----------+--------+------+
| CNUM | CNAME    | CITY     | RATING | SNUM |
+------+----------+----------+--------+------+
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+

11. Match salespeople to customers according to what city they lived in.
 select * from salespeople s join customers c on s.city=c.city;
+------+--------+----------+------+------+----------+----------+--------+------+
| SNUM | SNAME  | CITY     | COMM | CNUM | CNAME    | CITY     | RATING | SNUM |
+------+--------+----------+------+------+----------+----------+--------+------+
| 1005 | Fran   | London   | 0.26 | 2001 | Hoffman  | London   |    100 | 1001 |
| 1004 | Motika | London   | 0.11 | 2001 | Hoffman  | London   |    100 | 1001 |
| 1001 | Peel   | London   | 0.12 | 2001 | Hoffman  | London   |    100 | 1001 |
| 1002 | Serres | San Jose | 0.13 | 2003 | Liu      | San Jose |    200 | 1002 |
| 1005 | Fran   | London   | 0.26 | 2006 | Clemens  | London   |    100 | 1001 |
| 1004 | Motika | London   | 0.11 | 2006 | Clemens  | London   |    100 | 1001 |
| 1001 | Peel   | London   | 0.12 | 2006 | Clemens  | London   |    100 | 1001 |
| 1002 | Serres | San Jose | 0.13 | 2008 | Cisneros | San Jose |    300 | 1007 |
+------+--------+----------+------+------+----------+----------+--------+------+

12. Find the largest order taken by each salesperson.
 select s.*,amt from salespeople s join (select snum,max(amt)amt from orders group by snum) as t on s.snum=t.snum;
+------+---------+-----------+------+---------+
| SNUM | SNAME   | CITY      | COMM | amt     |
+------+---------+-----------+------+---------+
| 1001 | Peel    | London    | 0.12 | 9891.88 |
| 1002 | Serres  | San Jose  | 0.13 | 5160.45 |
| 1003 | AxelRod | New York  | 0.10 | 1713.23 |
| 1004 | Motika  | London    | 0.11 | 1900.10 |
| 1007 | Rifkin  | Barcelona | 0.15 | 1098.16 |
+------+---------+-----------+------+---------+

13. Find customers in San Jose who have a rating above 200.
 select * from customers where city='san jose' and rating>200;
+------+----------+----------+--------+------+
| CNUM | CNAME    | CITY     | RATING | SNUM |
+------+----------+----------+--------+------+
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+

14. List the names and commissions of all salespeople in London.
 select sname as names,comm as commmisions from salespeople where city="london";
+--------+-------------+
| names  | commmisions |
+--------+-------------+
| Peel   |        0.12 |
| Motika |        0.11 |
| Fran   |        0.26 |
+--------+-------------+

15. List all the orders of salesperson Motika from the Orders table.
 select o.* from orders o join salespeople s on o.snum=s.snum where s.sname='motika';
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3002 | 1900.10 | 1996-10-03 | 2007 | 1004 |
+------+---------+------------+------+------+

16. Find all customers with orders on October 3.
 select c.* from customers c join orders o on o.cnum=c.cnum where monthname(odate)='October' and day(odate)=3;
+------+----------+----------+--------+------+
| CNUM | CNAME    | CITY     | RATING | SNUM |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   |    100 | 1001 |
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2007 | Pereira  | Rome     |    100 | 1004 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+

17. Give the sums of the amounts from the Orders table, grouped by date, eliminating all those dates where the SUM was not at least 2000.00 above the MAX amount.
 select odate,sum(amt)sum from orders group by odate having sum<=max(amt)+2000.00;
+------------+----------+
| odate      | sum      |
+------------+----------+
| 1996-10-04 |  1788.98 |
| 1996-10-05 |  4723.00 |
| 1996-10-06 | 11201.83 |
+------------+----------+

18. Select all orders that had amounts that were greater than at least one of the orders from October 6.
 select * from orders where amt>(select min(amt) from customers c join orders o on o.cnum=c.cnum where monthname(odate)='October' and day(odate)=6 group by odate);
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3002 | 1900.10 | 1996-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1996-10-03 | 2003 | 1002 |
| 3008 | 4723.00 | 1996-10-05 | 2006 | 1001 |
| 3009 | 1713.23 | 1996-10-04 | 2002 | 1003 |
| 3011 | 9891.88 | 1996-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+

19. Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.
 select * from salespeople s where exists(select * from customers c where s.snum=c.snum and rating=300);
+------+--------+-----------+------+
| SNUM | SNAME  | CITY      | COMM |
+------+--------+-----------+------+
| 1002 | Serres | San Jose  | 0.13 |
| 1007 | Rifkin | Barcelona | 0.15 |
+------+--------+-----------+------+

20. Find all pairs of customers having the same rating.
 select * from customers a,customers b where a.rating=b.rating and a.cnum<b.cnum;
+------+----------+--------+--------+------+------+----------+----------+--------+------+
| CNUM | CNAME    | CITY   | RATING | SNUM | CNUM | CNAME    | CITY     | RATING | SNUM |
+------+----------+--------+--------+------+------+----------+----------+--------+------+
| 2001 | Hoffman  | London |    100 | 1001 | 2006 | Clemens  | London   |    100 | 1001 |
| 2001 | Hoffman  | London |    100 | 1001 | 2007 | Pereira  | Rome     |    100 | 1004 |
| 2002 | Giovanni | Rome   |    200 | 1003 | 2003 | Liu      | San Jose |    200 | 1002 |
| 2004 | Grass    | Berlin |    300 | 1002 | 2008 | Cisneros | San Jose |    300 | 1007 |
| 2006 | Clemens  | London |    100 | 1001 | 2007 | Pereira  | Rome     |    100 | 1004 |
+------+----------+--------+--------+------+------+----------+----------+--------+------+

21. Find all customers whose CNUM is 1000 above the SNUM of Serres.
select * from customers where cnum>=(select snum+1000 from salespeople where sname='serres');
+------+----------+----------+--------+------+
| CNUM | CNAME    | CITY     | RATING | SNUM |
+------+----------+----------+--------+------+
| 2002 | Giovanni | Rome     |    200 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2006 | Clemens  | London   |    100 | 1001 |
| 2007 | Pereira  | Rome     |    100 | 1004 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+

22. Give the salespeople’s commissions as percentages instead of decimal numbers.
 select snum,sname,city,concat(round(comm*100),'%')percentage from salespeople;
+------+---------+-----------+------------+
| snum | sname   | city      | percentage |
+------+---------+-----------+------------+
| 1001 | Peel    | London    | 12%        |
| 1002 | Serres  | San Jose  | 13%        |
| 1003 | AxelRod | New York  | 10%        |
| 1004 | Motika  | London    | 11%        |
| 1005 | Fran    | London    | 26%        |
| 1007 | Rifkin  | Barcelona | 15%        |
+------+---------+-----------+------------+

23. Find the largest order taken by each salesperson on each date, eliminating those MAX orders which are less than $3000.00 in value.
select * from salespeople s join (select onum,odate,max(amt),snum from orders group by onum,odate having max(amt)>3000)as t on s.snum=t.snum;
+------+--------+----------+------+------+------------+----------+------+
| SNUM | SNAME  | CITY     | COMM | onum | odate      | max(amt) | snum |
+------+--------+----------+------+------+------------+----------+------+
| 1001 | Peel   | London   | 0.12 | 3008 | 1996-10-05 |  4723.00 | 1001 |
| 1001 | Peel   | London   | 0.12 | 3011 | 1996-10-06 |  9891.88 | 1001 |
| 1002 | Serres | San Jose | 0.13 | 3005 | 1996-10-03 |  5160.45 | 1002 |
+------+--------+----------+------+------+------------+----------+------+

24. List the largest orders for October 3, for each salesperson.
 select s.*,t.amt from salespeople s join (select snum,max(amt)amt from orders where monthname(odate)='october' and day(odate)=3 group by snum)as t on s.snum=t.snum;
+------+--------+-----------+------+---------+
| SNUM | SNAME  | CITY      | COMM | amt     |
+------+--------+-----------+------+---------+
| 1001 | Peel   | London    | 0.12 |  767.19 |
| 1002 | Serres | San Jose  | 0.13 | 5160.45 |
| 1004 | Motika | London    | 0.11 | 1900.10 |
| 1007 | Rifkin | Barcelona | 0.15 | 1098.16 |
+------+--------+-----------+------+---------+

25. Find all customers located in cities where Serres (SNUM 1002) has customers.
 select c.* from customers c join (select city from salespeople where sname='serres') as t on c.city=t.city;
+------+----------+----------+--------+------+
| CNUM | CNAME    | CITY     | RATING | SNUM |
+------+----------+----------+--------+------+
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+

26. Select all customers with a rating above 200.00.
 select * from customers where rating>200.00;
+------+----------+----------+--------+------+
| CNUM | CNAME    | CITY     | RATING | SNUM |
+------+----------+----------+--------+------+
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+

27. Count the number of salespeople currently listing orders in the Orders table.
select count(distinct(o.snum))count from salespeople s join orders o where s.snum=o.snum;
+-------+
| count |
+-------+
|     5 |
+-------+

28. Write a query that produces all customers serviced by salespeople with a commission above
12%. Output the customer’s name and the salesperson’s rate of commission.
 select cname,sname,comm from customers c join salespeople s on c.snum=s.snum where comm*100>12;
+----------+--------+------+
| cname    | sname  | comm |
+----------+--------+------+
| Liu      | Serres | 0.13 |
| Grass    | Serres | 0.13 |
| Cisneros | Rifkin | 0.15 |
+----------+--------+------+

29. Find salespeople who have multiple customers.
 select s.* from salespeople s join (select snum from customers group by snum having count(snum)>1)as t on s.snum=t.snum;
+------+--------+----------+------+
| SNUM | SNAME  | CITY     | COMM |
+------+--------+----------+------+
| 1001 | Peel   | London   | 0.12 |
| 1002 | Serres | San Jose | 0.13 |
+------+--------+----------+------+

30. Find salespeople with customers located in their city.
 select s.* from salespeople s join customers c on s.city=c.city;
+------+--------+----------+------+
| SNUM | SNAME  | CITY     | COMM |
+------+--------+----------+------+
| 1005 | Fran   | London   | 0.26 |
| 1004 | Motika | London   | 0.11 |
| 1001 | Peel   | London   | 0.12 |
| 1002 | Serres | San Jose | 0.13 |
| 1005 | Fran   | London   | 0.26 |
| 1004 | Motika | London   | 0.11 |
| 1001 | Peel   | London   | 0.12 |
| 1002 | Serres | San Jose | 0.13 |
+------+--------+----------+------+

31. Find all salespeople whose name starts with ‘P’ and the fourth character is ‘l’.
 select * from salespeople where sname like 'p__l%';
+------+-------+--------+------+
| SNUM | SNAME | CITY   | COMM |
+------+-------+--------+------+
| 1001 | Peel  | London | 0.12 |
+------+-------+--------+------+

32. Write a query that uses a subquery to obtain all orders for the customer named Cisneros. Assume you do not know his customer number.
 select * from orders where snum=(select snum from customers where cname='Cisneros');
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1996-10-03 | 2008 | 1007 |
| 3006 | 1098.16 | 1996-10-03 | 2008 | 1007 |
+------+---------+------------+------+------+

33. Find the largest orders for Serres and Rifkin.
select t.*,amt from (select snum,max(amt)amt from orders group by snum) as a join (select * from salespeople where sname='Serres' or sname='Rifkin') as t on a.snum=t.snum;
+------+--------+-----------+------+---------+
| SNUM | SNAME  | CITY      | COMM | amt     |
+------+--------+-----------+------+---------+
| 1002 | Serres | San Jose  | 0.13 | 5160.45 |
| 1007 | Rifkin | Barcelona | 0.15 | 1098.16 |
+------+--------+-----------+------+---------+

34. Extract the Salespeople table in the following order : SNUM, SNAME, COMMISSION, CITY.
 select snum,sname,comm as commision,city from salespeople;
+------+---------+-----------+-----------+
| snum | sname   | commision | city      |
+------+---------+-----------+-----------+
| 1001 | Peel    |      0.12 | London    |
| 1002 | Serres  |      0.13 | San Jose  |
| 1003 | AxelRod |      0.10 | New York  |
| 1004 | Motika  |      0.11 | London    |
| 1005 | Fran    |      0.26 | London    |
| 1007 | Rifkin  |      0.15 | Barcelona |
+------+---------+-----------+-----------+

35. Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range.
 select * from customers where cname between 'A' and 'G';
+------+----------+----------+--------+------+
| CNUM | CNAME    | CITY     | RATING | SNUM |
+------+----------+----------+--------+------+
| 2006 | Clemens  | London   |    100 | 1001 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+

36. Select all the possible combinations of customers that you can assign.
 select * from customers c,customers d where c.cnum<d.cnum;
+------+----------+----------+--------+------+------+----------+----------+--------+------+
| CNUM | CNAME    | CITY     | RATING | SNUM | CNUM | CNAME    | CITY     | RATING | SNUM |
+------+----------+----------+--------+------+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   |    100 | 1001 | 2002 | Giovanni | Rome     |    200 | 1003 |
| 2001 | Hoffman  | London   |    100 | 1001 | 2003 | Liu      | San Jose |    200 | 1002 |
| 2001 | Hoffman  | London   |    100 | 1001 | 2004 | Grass    | Berlin   |    300 | 1002 |
| 2001 | Hoffman  | London   |    100 | 1001 | 2006 | Clemens  | London   |    100 | 1001 |
| 2001 | Hoffman  | London   |    100 | 1001 | 2007 | Pereira  | Rome     |    100 | 1004 |
| 2001 | Hoffman  | London   |    100 | 1001 | 2008 | Cisneros | San Jose |    300 | 1007 |
| 2002 | Giovanni | Rome     |    200 | 1003 | 2003 | Liu      | San Jose |    200 | 1002 |
| 2002 | Giovanni | Rome     |    200 | 1003 | 2004 | Grass    | Berlin   |    300 | 1002 |
| 2002 | Giovanni | Rome     |    200 | 1003 | 2006 | Clemens  | London   |    100 | 1001 |
| 2002 | Giovanni | Rome     |    200 | 1003 | 2007 | Pereira  | Rome     |    100 | 1004 |
| 2002 | Giovanni | Rome     |    200 | 1003 | 2008 | Cisneros | San Jose |    300 | 1007 |
| 2003 | Liu      | San Jose |    200 | 1002 | 2004 | Grass    | Berlin   |    300 | 1002 |
| 2003 | Liu      | San Jose |    200 | 1002 | 2006 | Clemens  | London   |    100 | 1001 |
| 2003 | Liu      | San Jose |    200 | 1002 | 2007 | Pereira  | Rome     |    100 | 1004 |
| 2003 | Liu      | San Jose |    200 | 1002 | 2008 | Cisneros | San Jose |    300 | 1007 |
| 2004 | Grass    | Berlin   |    300 | 1002 | 2006 | Clemens  | London   |    100 | 1001 |
| 2004 | Grass    | Berlin   |    300 | 1002 | 2007 | Pereira  | Rome     |    100 | 1004 |
| 2004 | Grass    | Berlin   |    300 | 1002 | 2008 | Cisneros | San Jose |    300 | 1007 |
| 2006 | Clemens  | London   |    100 | 1001 | 2007 | Pereira  | Rome     |    100 | 1004 |
| 2006 | Clemens  | London   |    100 | 1001 | 2008 | Cisneros | San Jose |    300 | 1007 |
| 2007 | Pereira  | Rome     |    100 | 1004 | 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+------+----------+----------+--------+------+

37. Select all orders that are greater than the average for October 4.
 select * from orders where amt>( select amt from (select odate,avg(amt)amt from orders group by odate having monthname(odate)='October' and day(odate)=4) as t);
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3002 | 1900.10 | 1996-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1996-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1996-10-03 | 2008 | 1007 |
| 3008 | 4723.00 | 1996-10-05 | 2006 | 1001 |
| 3009 | 1713.23 | 1996-10-04 | 2002 | 1003 |
| 3010 | 1309.95 | 1996-10-06 | 2004 | 1002 |
| 3011 | 9891.88 | 1996-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+
38. Write a select command using a corelated subquery that selects the names and numbers of all customers with ratings equal to the maximum for their city.
 select cname,cnum,rating from customers c1 where rating=(select max(c2.rating) from customers c2 where c2.city=c1.city);
+----------+------+--------+
| cname    | cnum | rating |
+----------+------+--------+
| Hoffman  | 2001 |    100 |
| Giovanni | 2002 |    200 |
| Grass    | 2004 |    300 |
| Clemens  | 2006 |    100 |
| Cisneros | 2008 |    300 |
+----------+------+--------+

39. Write a query that totals the orders for each day and places the results in descending order.
 select odate,count(odate)cnt from orders group by odate order by cnt desc;
+------------+-----+
| odate      | cnt |
+------------+-----+
| 1996-10-03 |   5 |
| 1996-10-04 |   2 |
| 1996-10-06 |   2 |
| 1996-10-05 |   1 |
+------------+-----+

40. Write a select command that produces the rating followed by the name of each customer in San Jose.
select rating,cname from customers where city='San Jose';
+--------+----------+
| rating | cname    |
+--------+----------+
|    200 | Liu      |
|    300 | Cisneros |
+--------+----------+

41. Find all orders with amounts smaller than any amount for a customer in San Jose.
 select * from orders where amt<(select max(amt) from (select t.cnum,max(amt)amt from orders o join ( select * from customers where city='san jose') as t on o.cnum=t.cnum group by t.cnum)as p);
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1996-10-03 | 2008 | 1007 |
| 3002 | 1900.10 | 1996-10-03 | 2007 | 1004 |
| 3003 |  767.19 | 1996-10-03 | 2001 | 1001 |
| 3006 | 1098.16 | 1996-10-03 | 2008 | 1007 |
| 3007 |   75.75 | 1996-10-04 | 2002 | 1003 |
| 3008 | 4723.00 | 1996-10-05 | 2006 | 1001 |
| 3009 | 1713.23 | 1996-10-04 | 2002 | 1003 |
| 3010 | 1309.95 | 1996-10-06 | 2004 | 1002 |
+------+---------+------------+------+------+



42. Find all orders with above average amounts for their customers.
 select o1.* from orders o1 where o1.amt>(select cnum from (select cnum,avg(amt) from orders o2 where o2.cnum=o1.cnum group by cnum)as t);
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3005 | 5160.45 | 1996-10-03 | 2003 | 1002 |
| 3008 | 4723.00 | 1996-10-05 | 2006 | 1001 |
| 3011 | 9891.88 | 1996-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+

43. Write a query that selects the highest rating in each city.
select city,max(rating) from customers group by city;
+----------+-------------+
| city     | max(rating) |
+----------+-------------+
| London   |         100 |
| Rome     |         200 |
| San Jose |         300 |
| Berlin   |         300 |
+----------+-------------+

44. Write a query that calculates the amount of the salesperson’s commission on each order by a customer with a rating above 100.00.
 select s.*,a.amt*s.comm as amount from orders a join salespeople s on a.snum=s.snum join ( select snum from customers where rating>100.00) as t on s.snum=t.snum;
+------+---------+-----------+------+----------+
| SNUM | SNAME   | CITY      | COMM | amount   |
+------+---------+-----------+------+----------+
| 1003 | AxelRod | New York  | 0.10 |   7.5750 |
| 1003 | AxelRod | New York  | 0.10 | 171.3230 |
| 1002 | Serres  | San Jose  | 0.13 | 670.8585 |
| 1002 | Serres  | San Jose  | 0.13 | 170.2935 |
| 1002 | Serres  | San Jose  | 0.13 | 670.8585 |
| 1002 | Serres  | San Jose  | 0.13 | 170.2935 |
| 1007 | Rifkin  | Barcelona | 0.15 |   2.8035 |
| 1007 | Rifkin  | Barcelona | 0.15 | 164.7240 |
+------+---------+-----------+------+----------+
8 rows in set (0.00 sec)

mysql> select s.*,sum(a.amt*s.comm) as amount from orders a join salespeople s on a.snum=s.snum join ( select snum from customers where rating>100.00) as t on s.snum=t.snum group by snum;
+------+---------+-----------+------+-----------+
| SNUM | SNAME   | CITY      | COMM | amount    |
+------+---------+-----------+------+-----------+
| 1003 | AxelRod | New York  | 0.10 |  178.8980 |
| 1002 | Serres  | San Jose  | 0.13 | 1682.3040 |
| 1007 | Rifkin  | Barcelona | 0.15 |  167.5275 |
+------+---------+-----------+------+-----------+

45. Count the customers with ratings above San Jose’s average.
 select count(rating) from customers where rating>(select avg(rating)avg from customers where city='san jose');
+---------------+
| count(rating) |
+---------------+
|             2 |
+---------------+

46. Write a query that produces all pairs of salespeople with themselves as well as duplicate rows with the order reversed.
  select * from salespeople c1,salespeople c2 order by c1.snum,c2.snum desc;
+------+---------+-----------+------+------+---------+-----------+------+
| SNUM | SNAME   | CITY      | COMM | SNUM | SNAME   | CITY      | COMM |
+------+---------+-----------+------+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 | 1007 | Rifkin  | Barcelona | 0.15 |
| 1001 | Peel    | London    | 0.12 | 1005 | Fran    | London    | 0.26 |
| 1001 | Peel    | London    | 0.12 | 1004 | Motika  | London    | 0.11 |
| 1001 | Peel    | London    | 0.12 | 1003 | AxelRod | New York  | 0.10 |
| 1001 | Peel    | London    | 0.12 | 1002 | Serres  | San Jose  | 0.13 |
| 1001 | Peel    | London    | 0.12 | 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.13 | 1007 | Rifkin  | Barcelona | 0.15 |
| 1002 | Serres  | San Jose  | 0.13 | 1005 | Fran    | London    | 0.26 |
| 1002 | Serres  | San Jose  | 0.13 | 1004 | Motika  | London    | 0.11 |
| 1002 | Serres  | San Jose  | 0.13 | 1003 | AxelRod | New York  | 0.10 |
| 1002 | Serres  | San Jose  | 0.13 | 1002 | Serres  | San Jose  | 0.13 |
| 1002 | Serres  | San Jose  | 0.13 | 1001 | Peel    | London    | 0.12 |
| 1003 | AxelRod | New York  | 0.10 | 1007 | Rifkin  | Barcelona | 0.15 |
| 1003 | AxelRod | New York  | 0.10 | 1005 | Fran    | London    | 0.26 |
| 1003 | AxelRod | New York  | 0.10 | 1004 | Motika  | London    | 0.11 |
| 1003 | AxelRod | New York  | 0.10 | 1003 | AxelRod | New York  | 0.10 |
| 1003 | AxelRod | New York  | 0.10 | 1002 | Serres  | San Jose  | 0.13 |
| 1003 | AxelRod | New York  | 0.10 | 1001 | Peel    | London    | 0.12 |
| 1004 | Motika  | London    | 0.11 | 1007 | Rifkin  | Barcelona | 0.15 |
| 1004 | Motika  | London    | 0.11 | 1005 | Fran    | London    | 0.26 |
| 1004 | Motika  | London    | 0.11 | 1004 | Motika  | London    | 0.11 |
| 1004 | Motika  | London    | 0.11 | 1003 | AxelRod | New York  | 0.10 |
| 1004 | Motika  | London    | 0.11 | 1002 | Serres  | San Jose  | 0.13 |
| 1004 | Motika  | London    | 0.11 | 1001 | Peel    | London    | 0.12 |
| 1005 | Fran    | London    | 0.26 | 1007 | Rifkin  | Barcelona | 0.15 |
| 1005 | Fran    | London    | 0.26 | 1005 | Fran    | London    | 0.26 |
| 1005 | Fran    | London    | 0.26 | 1004 | Motika  | London    | 0.11 |
| 1005 | Fran    | London    | 0.26 | 1003 | AxelRod | New York  | 0.10 |
| 1005 | Fran    | London    | 0.26 | 1002 | Serres  | San Jose  | 0.13 |
| 1005 | Fran    | London    | 0.26 | 1001 | Peel    | London    | 0.12 |
| 1007 | Rifkin  | Barcelona | 0.15 | 1007 | Rifkin  | Barcelona | 0.15 |
| 1007 | Rifkin  | Barcelona | 0.15 | 1005 | Fran    | London    | 0.26 |
| 1007 | Rifkin  | Barcelona | 0.15 | 1004 | Motika  | London    | 0.11 |
| 1007 | Rifkin  | Barcelona | 0.15 | 1003 | AxelRod | New York  | 0.10 |
| 1007 | Rifkin  | Barcelona | 0.15 | 1002 | Serres  | San Jose  | 0.13 |
| 1007 | Rifkin  | Barcelona | 0.15 | 1001 | Peel    | London    | 0.12 |
+------+---------+-----------+------+------+---------+-----------+------+
47. Find all salespeople that are located in either Barcelona or London.
 select * from salespeople s where s.city in('barcelona','london');
+------+--------+-----------+------+
| SNUM | SNAME  | CITY      | COMM |
+------+--------+-----------+------+
| 1001 | Peel   | London    | 0.12 |
| 1004 | Motika | London    | 0.11 |
| 1005 | Fran   | London    | 0.26 |
| 1007 | Rifkin | Barcelona | 0.15 |
+------+--------+-----------+------+

48. Find all salespeople with only one customer.
 select s.* from salespeople s join ( select snum,count(cnum) from customers group by snum having count(cnum)=1) as t on t.snum=s.snum;
+------+---------+-----------+------+
| SNUM | SNAME   | CITY      | COMM |
+------+---------+-----------+------+
| 1003 | AxelRod | New York  | 0.10 |
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rifkin  | Barcelona | 0.15 |
+------+---------+-----------+------+

49. Write a query that joins the Customer table to itself to find all pairs of customers served by a single salesperson.
select c1.cname,c2.cname,c1.snum from customers c1,customers c2 where c1.snum=c2.snum and (c1.cname<>c2.cname and c1.cnum<c2.cnum);
+---------+---------+------+
| cname   | cname   | snum |
+---------+---------+------+
| Hoffman | Clemens | 1001 |
| Liu     | Grass   | 1002 |
+---------+---------+------+

50. Write a query that will give you all orders for more than $1000.00
 select * from orders where amt>1000;
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3002 | 1900.10 | 1996-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1996-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1996-10-03 | 2008 | 1007 |
| 3008 | 4723.00 | 1996-10-05 | 2006 | 1001 |
| 3009 | 1713.23 | 1996-10-04 | 2002 | 1003 |
| 3010 | 1309.95 | 1996-10-06 | 2004 | 1002 |
| 3011 | 9891.88 | 1996-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+

51. Write a query that lists each order number followed by the name of the customer who made that order.
 select o.*,cname from orders o join customers c on o.cnum=c.cnum;
+------+---------+------------+------+------+----------+
| ONUM | AMT     | ODATE      | CNUM | SNUM | cname    |
+------+---------+------------+------+------+----------+
| 3003 |  767.19 | 1996-10-03 | 2001 | 1001 | Hoffman  |
| 3007 |   75.75 | 1996-10-04 | 2002 | 1003 | Giovanni |
| 3009 | 1713.23 | 1996-10-04 | 2002 | 1003 | Giovanni |
| 3005 | 5160.45 | 1996-10-03 | 2003 | 1002 | Liu      |
| 3010 | 1309.95 | 1996-10-06 | 2004 | 1002 | Grass    |
| 3008 | 4723.00 | 1996-10-05 | 2006 | 1001 | Clemens  |
| 3011 | 9891.88 | 1996-10-06 | 2006 | 1001 | Clemens  |
| 3002 | 1900.10 | 1996-10-03 | 2007 | 1004 | Pereira  |
| 3001 |   18.69 | 1996-10-03 | 2008 | 1007 | Cisneros |
| 3006 | 1098.16 | 1996-10-03 | 2008 | 1007 | Cisneros |
+------+---------+------------+------+------+----------+

52. Write 2 queries that select all salespeople (by name and number) who have customers in their cities who they do not service, one using a join and one a corelated subquery. Which solution is more elegant?

53. Write a query that selects all customers whose ratings are equal to or greater than ANY (in the SQL sense) of Serres’?
 select * from customers where rating>=(select min from(select s.snum,min(rating)min from customers c join salespeople s on c.snum=s.snum where sname='serres' group by s.snum) as t);
+------+----------+----------+--------+------+
| CNUM | CNAME    | CITY     | RATING | SNUM |
+------+----------+----------+--------+------+
| 2002 | Giovanni | Rome     |    200 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+

54. Write 2 queries that will produce all orders taken on October 3 or October 4.
 SELECT *
    -> FROM Orders
    -> WHERE ODATE between '1996-10-03' and '1996-10-04';
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1996-10-03 | 2008 | 1007 |
| 3002 | 1900.10 | 1996-10-03 | 2007 | 1004 |
| 3003 |  767.19 | 1996-10-03 | 2001 | 1001 |
| 3005 | 5160.45 | 1996-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1996-10-03 | 2008 | 1007 |
| 3007 |   75.75 | 1996-10-04 | 2002 | 1003 |
| 3009 | 1713.23 | 1996-10-04 | 2002 | 1003 |
+------+---------+------------+------+------+


 SELECT *
    -> FROM Orders
    -> WHERE ODATE IN ('1996-10-03', '1996-10-04');
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1996-10-03 | 2008 | 1007 |
| 3002 | 1900.10 | 1996-10-03 | 2007 | 1004 |
| 3003 |  767.19 | 1996-10-03 | 2001 | 1001 |
| 3005 | 5160.45 | 1996-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1996-10-03 | 2008 | 1007 |
| 3007 |   75.75 | 1996-10-04 | 2002 | 1003 |
| 3009 | 1713.23 | 1996-10-04 | 2002 | 1003 |
+------+---------+------------+------+------+


55. Write a query that produces all pairs of orders by a given customer. Name that customer and eliminate duplicates.
 select t.*,cname as custname from customers c join (select o1.cnum as custnum,o1.onum as or1,o2.onum as or2,o1.odate as date1,o2.odate as date2,o1.amt as amount1,o2.amt as amount2 from orders o1,orders o2 where o1.cnum=o2.cnum and o1.onum<>o2.onum and o1.onum<o2.onum) as t on c.cnum=t.custnum;
+---------+------+------+------------+------------+---------+---------+----------+
| custnum | or1  | or2  | date1      | date2      | amount1 | amount2 | custname |
+---------+------+------+------------+------------+---------+---------+----------+
|    2008 | 3001 | 3006 | 1996-10-03 | 1996-10-03 |   18.69 | 1098.16 | Cisneros |
|    2002 | 3007 | 3009 | 1996-10-04 | 1996-10-04 |   75.75 | 1713.23 | Giovanni |
|    2006 | 3008 | 3011 | 1996-10-05 | 1996-10-06 | 4723.00 | 9891.88 | Clemens  |
+---------+------+------+------------+------------+---------+---------+----------+

56. Find only those customers whose ratings are higher than every customer in Rome.
 select * from customers where rating>(select max(rating) from customers group by city having city='rome');
+------+----------+----------+--------+------+
| CNUM | CNAME    | CITY     | RATING | SNUM |
+------+----------+----------+--------+------+
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+

57. Write a query on the Customers table whose output will exclude all customers with a rating <= 100.00, unless they are located in Rome.
 select * from customers where rating>100.00 or city='rome';
+------+----------+----------+--------+------+
| CNUM | CNAME    | CITY     | RATING | SNUM |
+------+----------+----------+--------+------+
| 2002 | Giovanni | Rome     |    200 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2007 | Pereira  | Rome     |    100 | 1004 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+

58. Find all rows from the Customers table for which the salesperson number is 1001.
 select * from customers c where snum=1001;
+------+---------+--------+--------+------+
| CNUM | CNAME   | CITY   | RATING | SNUM |
+------+---------+--------+--------+------+
| 2001 | Hoffman | London |    100 | 1001 |
| 2006 | Clemens | London |    100 | 1001 |
+------+---------+--------+--------+------+

59. Find the total amount in Orders for each salesperson for whom this total is greater than the amount of the largest order in the table.
select s.*,t.sm from salespeople s join (select snum,sum(amt)sm from orders group by snum having sm>max(amt))as t on s.snum=t.snum;
+------+---------+-----------+------+----------+
| SNUM | SNAME   | CITY      | COMM | sm       |
+------+---------+-----------+------+----------+
| 1001 | Peel    | London    | 0.12 | 15382.07 |
| 1002 | Serres  | San Jose  | 0.13 |  6470.40 |
| 1003 | AxelRod | New York  | 0.10 |  1788.98 |
| 1007 | Rifkin  | Barcelona | 0.15 |  1116.85 |
+------+---------+-----------+------+----------+


60. Write a query that selects all orders save those with zeroes or NULLs in the amount field.
select *,amt from orders where amt is not null and amt<>0;
+------+---------+------------+------+------+---------+
| ONUM | AMT     | ODATE      | CNUM | SNUM | amt     |
+------+---------+------------+------+------+---------+
| 3001 |   18.69 | 1996-10-03 | 2008 | 1007 |   18.69 |
| 3002 | 1900.10 | 1996-10-03 | 2007 | 1004 | 1900.10 |
| 3003 |  767.19 | 1996-10-03 | 2001 | 1001 |  767.19 |
| 3005 | 5160.45 | 1996-10-03 | 2003 | 1002 | 5160.45 |
| 3006 | 1098.16 | 1996-10-03 | 2008 | 1007 | 1098.16 |
| 3007 |   75.75 | 1996-10-04 | 2002 | 1003 |   75.75 |
| 3008 | 4723.00 | 1996-10-05 | 2006 | 1001 | 4723.00 |
| 3009 | 1713.23 | 1996-10-04 | 2002 | 1003 | 1713.23 |
| 3010 | 1309.95 | 1996-10-06 | 2004 | 1002 | 1309.95 |
| 3011 | 9891.88 | 1996-10-06 | 2006 | 1001 | 9891.88 |
+------+---------+------------+------+------+---------+


61. Produce all combinations of salespeople and customer names such that the former precedes the latter alphabetically, and the latter has a rating of less than 200.
 select sname,cname from customers c join salespeople s on c.city=s.city where c.rating<200 order by sname;
+--------+---------+
| sname  | cname   |
+--------+---------+
| Fran   | Clemens |
| Fran   | Hoffman |
| Motika | Clemens |
| Motika | Hoffman |
| Peel   | Clemens |
| Peel   | Hoffman |
+--------+---------+

62. List all Salespeople’s names and the Commission they have earned.
 select sname,sum(comm*amt)commision from salespeople left join orders on salespeople.snum=orders.snum group by sname;
+---------+-----------+
| sname   | commision |
+---------+-----------+
| Peel    | 1845.8484 |
| Serres  |  841.1520 |
| AxelRod |  178.8980 |
| Motika  |  209.0110 |
| Fran    |      NULL |
| Rifkin  |  167.5275 |
+---------+-----------+

63. Write a query that produces the names and cities of all customers with the same rating as Hoffman. Write the query using Hoffman’s CNUM rather than his rating, so that it would still be usable if his rating changed.
 select * from customers where rating=(select rating from customers where cname="hoffman") and cnum<>(select cnum from customers where cname='hoffman');
+------+---------+--------+--------+------+
| CNUM | CNAME   | CITY   | RATING | SNUM |
+------+---------+--------+--------+------+
| 2006 | Clemens | London |    100 | 1001 |
| 2007 | Pereira | Rome   |    100 | 1004 |
+------+---------+--------+--------+------+

64. Find all salespeople for whom there are customers that follow them in alphabetical order.
65. Write a query that produces the names and ratings of all customers of all who have above
average orders.
66. Find the SUM of all purchases from the Orders table.
67. Write a SELECT command that produces the order number, amount and date for all rows in
the order table.
68. Count the number of nonNULL rating fields in the Customers table (including repeats).
69. Write a query that gives the names of both the salesperson and the customer for each order
after the order number.
70. List the commissions of all salespeople servicing customers in London.
71. Write a query using ANY or ALL that will find all salespeople who have no customers located in
their city.
72. Write a query using the EXISTS operator that selects all salespeople with customers located in
their cities who are not assigned to them.
73. Write a query that selects all customers serviced by Peel or Motika. (Hint : The SNUM field
relates the two tables to one another.)
74. Count the number of salespeople registering orders for each day. (If a salesperson has more
than one order on a given day, he or she should be counted only once.)
75. Find all orders attributed to salespeople in London.
76. Find all orders by customers not located in the same cities as their salespeople.
77. Find all salespeople who have customers with more than one current order.
78. Write a query that extracts from the Customers table every customer assigned to a
salesperson who currently has at least one other customer (besides the customer being
selected) with orders in the Orders table.
79. Write a query that selects all customers whose names begin with ‘C’.
80. Write a query on the Customers table that will find the highest rating in each city. Put the output
in this form : for the city (city) the highest rating is : (rating).
81. Write a query that will produce the SNUM values of all salespeople with orders currently in the
Orders table (without any repeats).
82. Write a query that lists customers in descending order of rating. Output the rating field first,
followed by the customer’s names and numbers.
83. Find the average commission for salespeople in London.
84. Find all orders credited to the same salesperson who services Hoffman (CNUM 2001).
85. Find all salespeople whose commission is in between 0.10 and 0.12 (both inclusive).

ACTS, Pune

Page 5 of 14
86. Write a query that will give you the names and cities of all salespeople in London with a
commission above 0.10.
87. What will be the output from the following query?
SELECT * FROM ORDERS
where (amt < 1000 OR NOT (odate = 10/03/1996 AND cnum >
2003));
88. Write a query that selects each customer’s smallest order.
89. Write a query that selects the first customer in alphabetical order whose name begins with G.
90. Write a query that counts the number of different nonNULL city values in the Customers table.
91. Find the average amount from the Orders table.
92. What would be the output from the following query?
SELECT * FROM ORDERS
WHERE NOT (odate = 10/03/96 OR snum > 1006) AND amt >=
1500);
93. Find all customers who are not located in San Jose and whose rating is above 200.
94. Give a simpler way to write this query :
SELECT snum, sname city, comm FROM salespeople
WHERE (comm > + 0.12 OR comm < 0.14);
95. Evaluate the following query :
SELECT * FROM orders
WHERE NOT ((odate = 10/03/96 AND snum > 1002) OR amt > 2000.00);
96. Which salespersons attend to customers not in the city they have been assigned to?
97. Which salespeople get commission greater than 0.11 are serving customers rated less than
250?
98. Which salespeople have been assigned to the same city but get different commission
percentages?
99. Which salesperson has earned the most by way of commission?
100.Does the customer who has placed the maximum number of orders have the maximum rating?
101.Has the customer who has spent the largest amount of money been given the highest rating?
102.List all customers in descending order of customer rating.
103.On which days has Hoffman placed orders?
104.Do all salespeople have different commissions?
105.Which salespeople have no orders between 10/03/1996 and 10/05/1996?
106.How many salespersons have succeeded in getting orders?
107.How many customers have placed orders?
108.On which date has each salesperson booked an order of maximum value?
109.Who is the most successful salesperson?
110.Who is the worst customer with respect to the company?
111.Are all customers not having placed orders greater than 200 totally been serviced by
salespersons Peel or Serres?
112.Which customers have the same rating?

ACTS, Pune

Page 6 of 14
113.Find all orders greater than the average for October 4th.
114.Which customers have above average orders?
115.List all customers with ratings above San Jose’s average.
116.Select the total amount in orders for each salesperson for whom the total is greater than the
amount of the largest order in the table.
117.Give names and numbers of all salespersons who have more than one customer.
118.Select all salespersons by name and number who have customers in their city whom they
don’t service.
119.Which customers’ rating should be lowered?
120.Is there a case for assigning a salesperson to Berlin?
121.Is there any evidence linking the performance of a salesperson to the commission that he or
she is being paid?
122.Does the total amount in orders by customer in Rome and London exceed the commission
paid to salespersons in London and New York by more than 5 times?
123.Which is the date, order number, amt and city for each salesperson (by name) for the
maximum order he has obtained?
124.Which salesperson(s) should be fired?
125.What is the total income for the company?
