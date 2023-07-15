Create Table Person ("id" Int PRIMARY KEY, "name" Varchar(50), "lastname" Varchar(50),"Amount" decimal)

Drop Table Person

Insert Into Person (id,name,lastname,Amount,grade) VALUES(6,'Mithilesh12','Yerendekar',28000,'C'),(7,'Kanchan12','Yerendekar',7000,'C')

UPDATE Person SET grade = 'B' Where id = '3' 

DELETE FROM Person WHERE "id"=2

SELECT * FROM Person ORDER BY name DESC

SELECT TOP 2 * FROM Person;

SELECT ROUND(AVG(Amount),2,2) FROM Person

SELECT name,Amount FROM Person WHERE grade = 'A' AND Amount >90000

ALTER TABLE Person ADD payment_id int

ALTER TABLE Person DROP Column address 

Select grade, AVG(Amount) AS Total FROM Person Group BY grade

SELECT COUNT(grade) AS count,grade FROM Person Group by grade Having grade='A' OR grade='B'

INSERT INTO Payment (id,payment_id,amount,payment_mode) VALUES(1,1,100,'Cash'),(2,2,100,'Card'),(6,6,300,'Net Banking'),
(3,3,200,'Cash'),(4,4,10,'Net Banking'),(5,5,500,'Cash')

Select * FROM Payment


SELECT *  FROM Person as p1 iNNER JOIN Address as a ON p1.address_id = a.address_id

Create Table Organisation2(id int PRIMARY KEY, employee_name varchar(20), employee_amount int)

INSERT INTO Organisation2(id,employee_name,employee_amount) VALUES(4,'Papa',2100)

INSERT INTO Organisation(id,employee_id,employee_name,manager_id) VALUES(1,3,'Mayuresh',2),(2,4,'Mithilesh',1),(3,2,'Mayur',4),(4,1,'Komal',3)

SELECT O1.employee_name as employee ,O2.employee_name as manager FROM Organisation as O1 JOIN Organisation as O2 ON O1.employee_id= O2.manager_id

SELECT employee_name,employee_amount FROM Organisation1 
UNION SELECT employee_name,employee_amount FROM Organisation2

SELECT * from Person

SELECT(SELECT name FROM Person WHERE p1.payment_id = Person.payment_id),amount from Payment as p1 Where amount>(Select AVG(amount) FROM Payment)

SELECT payment_id, LAG(payment_id,2) Over(Order BY payment_id),LEAD(payment_id,2) Over(Order BY payment_id) FROM Payment

SELECT amount ,CASE WHEN amount <= 10 THEN 'Good Product' WHEN amount <=100 THEN 'Modrate Product' ELSE 'dONT bUY' END AS prodStatus FROM Payment