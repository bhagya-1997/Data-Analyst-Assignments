## Bhagyashree Deshpande ##
## Assignment_Part3 ##

USE assignment;

-- 1. Write a stored procedure that accepts the month and year as inputs and prints the ordernumber, orderdate and status of the orders placed in that month. 
-- Example:  call order_status(2005, 11);

CREATE DEFINER = `root`@`localhost` PROCEDURE `assignment3_pro1`(month1 varchar(20), year1 int)
BEGIN
SELECT orderDate, status FROM orders WHERE year(orderdate) = year1 AND left(monthname(orderdate), 3) = month1;
END

call assignment3_pro1('Feb', 2003);
CALL assignment3_pro1('Feb', 2003);

-- 2. Write a stored procedure to insert a record into the cancellations table for all cancelled orders.

-- STEPS: 

-- a.	Create a table called cancellations with the following fields

-- id (primary key), customernumber (foreign key - Table customers), ordernumber (foreign key - Table Orders), comments

-- All values except id should be taken from the order table.

-- b. Read through the orders table . If an order is cancelled, then put an entry in the cancellations table.

CREATE DEFINER=`root`@`localhost` PROCEDURE 
BEGIN
create table if not exists cancellations(id int primary key auto_increment,ordernumber int,foreign key(orderNumber) references orders(orderNumber),customernumber int,foreign key(customerNumber) references customers(customerNumber));
  insert into cancellations(customernumber,orderNumber)
  select customerNumber,orderNumber from orders where status='Cancelled' ;
END

call assigment3_pro2();
CALL assigment3_pro2();

-- 3. a. Write function that takes the customernumber as input and returns the purchase_status based on the following criteria . [table:Payments]

-- if the total purchase amount for the customer is < 25000 status = Silver, amount between 25000 and 50000, status = Gold
-- if amount > 50000 Platinum

CREATE DEFINER=`root`@`localhost` FUNCTION `pur_stat`(cid int) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
    BEGIN
declare stat varchar(20);
	 declare credit numeric;
	 set credit = (select sum(Amount) from Payments where customerNumber=cid);
     
      if credit>50000 then
          set stat='platinum';
      elseif (credit>=25000 and
			credit <=50000) then    
            set stat='gold';
       elseif credit <25000 then
             set stat='silver';
		end if;
        return (stat);
	END

select pur_stat(103);
SELECT pur_stat(103);

-- b. Write a query that displays customerNumber, customername and purchase_status from customers table.
select customers.customerNumber,customerName, case
     when amount < 25000 then 'silver'
     when amount between 25000 and 50000 then 'Gold'
     when amount > 50000 then 'Platinum'
     end as purchasestatus from payments inner join customers ON payments.customerNumber=customers.customerNumber;
     
-- 4. Replicate the functionality of 'on delete cascade' and 'on update cascade' using triggers on movies and rentals tables. Note: Both tables - movies and rentals - don't have primary or foreign keys. Use only triggers to implement the above.

CREATE DEFINER=`root`@`localhost` PROCEDURE `assignment3_proc3`(custNo int)
  BEGIN
  DECLARE credit DECIMAL(10,2) DEFAULT 0;
  DECLARE Update_condition CONDITION FOR SQLSTATE '22012';
  if (select 1
  from (
  select creditLimt,
  case
   when amount < 25000 then 'silver'
   when amount between 25000 and 50000 then 'Gold'
   when amount > 50000 then 'Platinum'
   end as purchasestatus,a.customerNumber from  payments a inner join customer b
  on a.customerNumber=b.customerNumber) as a
  where customerNumber=custNo and purchaseatatus='Platinum' and creditLimit<100000
  )=1 then
  update customers
  set creditlimit=100000
  where customerNumber=custNo;
  SIGNAL SQLSTATE'22012'
  SET MESSAGE_TEXT='credit is less than 100000';
  elseif
  (  select 1
  from (
  select creditLimit,
  case
   when amount <25000 then 'silver'
   when amount between 25000 and 50000 then 'Gold'
   when amount >50000 then 'Platinum'
   end as purchasestatus,a.customerNumber from payments a inner join customers b
  on a.customerNumber=b.customerNumber) as a
  where customerNumber=custNo and purchasestatus='silver' and creditLimit>60000
  )=1 then
  update customers
  set creditlimit=60000
  where customerNumber=custNo;
  SIGNAL SQLSTATE'22012'
  SET MESSAGE_TEXT='credit is less than 60000';
  end if;
  commit;
  END
  
CREATE DEFINER=`root`@`localhost` TRIGGER upd_cascade
AFTER UPDATE ON `movies`
FOR EACH ROW
BEGIN
update rentals set movieid = new.id
where movieid = old.id;
END;

-- On delete cascade
CREATE DEFINER=`root`@`localhost` TRIGGER del_cascade

AFTER DELETE ON `movies`
FOR EACH ROW
BEGIN
delete from rentals
where movieid = old.id;
END$$

delimiter ;

-- 5. Select the first name of the employee who gets the third highest salary. [table: employee]

SELECT * FROM employee ORDER BY salary DESC LIMIT 1 OFFSET 2;

-- 6. Assign a rank to each employee based on their salary. The person having the highest salary has rank 1. [table: employee]

SELECT empid,fname,lname,deptno,salary, RANK () OVER (ORDER BY salary DESC) rank_no FROM employee;