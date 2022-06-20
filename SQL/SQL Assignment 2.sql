## Bhagyashree Deshpande ##
## Assignment_Part2 ##

USE assignment;

-- 1. select all employees in department 10 whose salary is greater than 3000. [table: employee]

SELECT * FROM employee WHERE deptno = 10 AND salary > 3000;

-- 2. The grading of students based on the marks they have obtained is done as follows:
-- 40 to 50 -> Second Class
-- 50 to 60 -> First Class
-- 60 to 80 -> First Class
-- 80 to 100 -> Distinctions

-- a. How many students have graduated with first class?

SELECT * FROM students WHERE marks BETWEEN 50 AND 80;

-- b. How many students have obtained distinction? [table: students]

SELECT * FROM students WHERE marks BETWEEN 80 AND 100;

-- 3. Get a list of city names from station with even ID numbers only. Exclude duplicates from your answer.[table: station]

SELECT DISTINCT city FROM station WHERE id%2 = 0;

-- 4. Find the difference between the total number of city entries in the table and the number of distinct city entries in the table. In other words, if N is the number of city entries in station, and N1 is the number of distinct city names in station, write a query to find the value of N-N1 from station. [table: station]

SELECT count(city)-count(DISTINCT city) AS difference FROM station;

-- 5. Answer the following
-- a. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates. [Hint: Use RIGHT() / LEFT() methods ]

SELECT DISTINCT city FROM station WHERE city LIKE "a%" OR city LIKE "e%" OR city LIKE "i%" OR city LIKE "o%" OR city LIKE "u%";

-- b. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

SELECT DISTINCT city FROM station WHERE city LIKE "a%a" OR city LIKE "e%e" OR city LIKE "i%i" OR city LIKE "o%o" OR city LIKE "u%u";

-- c. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

SELECT DISTINCT city FROM station WHERE city NOT LIKE "a%" AND city NOT LIKE "e%" AND city NOT LIKE "i%" AND city NOT LIKE "o%" AND city NOT LIKE "u%";

-- d. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates. [table: station]

SELECT DISTINCT city FROM station WHERE city NOT LIKE "a%" AND city NOT LIKE "%a" AND city NOT LIKE "e%" AND city NOT LIKE "%e" AND city NOT LIKE "i%" AND city NOT LIKE "%i" AND city NOT LIKE "o%" AND city NOT LIKE "%o" AND city NOT LIKE "u%" AND city NOT LIKE "%u";

-- 6. Write a query that prints a list of employee names having a salary greater than $2000 per month who have been employed for less than 36 months. Sort your result by descending order of salary. [table: emp]

SELECT first_name, last_name, salary, PERIOD_DIFF(MONTH(CURDATE()), MONTH(hire_date)) AS diff FROM emp WHERE salary > 2000 AND PERIOD_DIFF(MONTH(CURDATE()), MONTH(hire_date)) BETWEEN 1 AND 10 ORDER BY salary DESC;

-- 7. How much money does the company spend every month on salaries for each department? [table: employee]

SELECT SUM(salary), deptno FROM emp GROUP BY deptno ORDER BY deptno;

-- 8. How many cities in the CITY table have a Population larger than 100000. [table: city]

SELECT COUNT(name) AS CITY FROM city WHERE population > 100000;

-- 9. What is the total population of California? [table: city]

SELECT SUM(population) AS "Total Population" FROM city WHERE district = "California";

-- 10. What is the average population of the districts in each country? [table: city]

SELECT countrycode, AVG(population) AS "avg(population)" FROM city GROUP BY countrycode ORDER BY countrycode;

-- 11. Find the ordernumber, status, customernumber, customername and comments for all orders that are Disputed = [table: orders, customers]

SELECT orders.ordernumber, customers.customernumber, customers.customername, orders.status, orders.comments FROM orders JOIN customers ON orders.customernumber = customers.customernumber;