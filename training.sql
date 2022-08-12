/*I work  with Oracle 18c database SQL Developer*/

/*Creating the carshop user with password*/
CREATE USER carshop IDENTIFIED BY password;

/*Giving all priviliges to the carshop*/
GRANT ALL PRIVILEGES TO carshop;

/*Revoke all privileges for the carshop*/
REVOKE ALL PRIVILEGES FROM carshop;

/*Creating  table "workers" with the appropriate constraints*/
CREATE TABLE workers
    (ID NUMBER NOT NULL,
    first_name VARCHAR2(30) NOT NULL, 
    last_name VARCHAR2(60) NOT NULL,
    PESEL CHAR(11) NOT NULL,
    sex VARCHAR2(1) NOT NULL CHECK (sex in ('M', 'F')),
    date_of_birth DATE NOT NULL,
    salary NUMBER NOT NULL CHECK(salary>=700)
    );
	
/*Adding the primary key to the table "workers" */
ALTER TABLE workers
ADD CONSTRAINT pk_workers PRIMARY KEY (ID);
	
/*Entering the data into the "workres" table*/
INSERT INTO workers (id, first_name, last_name, PESEL, sex, date_of_birth, salary)
VALUES ('1', 'Stefan', 'Kaluza','98121411111', 'M', to_date('98/12/14','RR/MM/DD'), '1000');
INSERT INTO workers (id, first_name, last_name, PESEL, sex, date_of_birth, salary)
VALUES('2', 'Rafu', 'Cabbage','70122011111', 'M', to_date('70/12/20','RR/MM/DD'), '1500');
INSERT INTO workers (id, first_name, last_name, PESEL, sex, date_of_birth, salary)
VALUES('3', 'Cotrney', 'Kissbell','96061511111', 'F', to_date('96/06/15','RR/MM/DD'), '1300');
INSERT INTO workers (id, first_name, last_name, PESEL, sex, date_of_birth, salary)
VALUES('4', 'Steve', 'Rafachi','82011911111', 'M', to_date('82/11/19','RR/MM/DD'), '2100');
INSERT INTO workers (id, first_name, last_name, PESEL, sex, date_of_birth, salary)
VALUES('5', 'Tommy', 'Train','76022511111', 'M', to_date('76/02/25','RR/MM/DD'), '2000');
INSERT INTO workers (id, first_name, last_name, PESEL, sex, date_of_birth, salary)
VALUES('6', 'Kate', 'Lipton','00062011111', 'F', to_date('00/06/20','RR/MM/DD'), '1250');
INSERT INTO workers (id, first_name, last_name, PESEL, sex, date_of_birth, salary)
VALUES('7', 'Maddie', 'Taratata','67090111111', 'F', to_date('67/09/01','RR/MM/DD'), '2600');
INSERT INTO workers (id, first_name, last_name, PESEL, sex, date_of_birth, salary)
VALUES('8', 'Julia', 'Boberts','01121411111', 'F', to_date('01/12/14','RR/MM/DD'), '900');
INSERT INTO workers (id, first_name, last_name, PESEL, sex, date_of_birth, salary)
VALUES('9', 'Andrzej', 'Tomczyk','94112011111', 'M', to_date('94/11/20','RR/MM/DD'), '3500');
INSERT INTO workers (id, first_name, last_name, PESEL, sex, date_of_birth, salary)
VALUES('10', 'Katia', 'Cotangens','98121411111', 'F', to_date('98/12/14','RR/MM/DD'), '1000');	

/* After correct input of the data, I approve operations with commit*/
COMMIT;

/*Creating "departments" table  with the appropriate constraints*/
CREATE TABLE departments
    (department_code NUMBER NOT NULL, 
    department_name VARCHAR2(30) NOT NULL, 
    manager_id NUMBER , 
    city VARCHAR2(30) NOT NULL
     );
	 
 /*Adding the primary key to the "departments"  table*/
ALTER TABLE departments
ADD CONSTRAINT pk_departments PRIMARY KEY (department_code);



/*Entering the data into the "departments" table */
INSERT INTO departments (department_code, department_name, manager_id, city)
VALUES ('1','Accounting department','2','Saint-Tropez');
INSERT INTO departments (department_code, department_name, manager_id, city)
VALUES ('2','Auto parts department','6','Tokyo');
INSERT INTO departments (department_code, department_name, manager_id, city)
VALUES ('3','Administration department','9','New York');
INSERT INTO departments (department_code, department_name, manager_id, city)
VALUES ('4','IT department','1','Paris');
INSERT INTO departments (department_code, department_name, manager_id, city)
VALUES ('5','Sales department','7','Warsaw');

/*Adding the foreign key to the "departments" table*/
ALTER TABLE departments
ADD CONSTRAINT fk_dep_workers FOREIGN KEY (manager_id)
REFERENCES workers(ID);

/*After adding the foreign key to the "departments" table, it is okay to add the constraint "not null" for that table. If we had done it at the beginning, it would not be possible to add a foreign key*/
ALTER TABLE departments
MODIFY manager_id not null;

/*After correct input of the data, I approve operations with commit*/
COMMIT;


/*Creating  table "cars" with the appropriate constraints*/
CREATE TABLE cars
    (ID NUMBER NOT NULL, 
    car_model VARCHAR2(50) NOT NULL, 
    body_type VARCHAR2(15) NOT NULL, 
    selling_price NUMBER NOT NULL, 
    purchase_price NUMBER NOT NULL, 
    tax_rate NUMBER NOT NULL
   );
   
/*Adding the primary key to the "cars" table*/
 ALTER TABLE cars
ADD CONSTRAINT pk_cars PRIMARY KEY (ID); 

/*Entering the data into the "cars" table*/
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('1', 'Opel Astra', 'Cabrio','4500','3200', '20');
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('2', 'BMW 320D', 'Sedan','8000','6300', '20');
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('3', 'Toyota Yaris', 'Hatchback','3300','2200', '20');
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('4', 'Ford Transit', 'Bus','8500','7200', '20');
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('5', 'Peugeot 206CC', 'Cabrio','6500','4800', '20');
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('6', 'Renault Clio', 'Hatchback','2500','1700', '20');
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('7', 'Kia Rio', 'Wagon','2500','1200', '20');
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('8', 'Fiat Ducato', 'Bus','12500','8200', '20');
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('9', 'Lexus LS400', 'Sedan','20500','15600', '20');
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('10', 'Fiat Uno', 'Hatchback','1500','700', '20');
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('11', 'Ford Modeo', 'Wagon','10300','9200', '20');
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('12', 'Toyota GT86', 'Hatchback','17800','17000', '20');
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('13', 'Mercedes W220', 'Sedan','20300','13200', '20');
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('14', 'BMW 335i', 'Cabrio','50000','44200', '20');
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('15', 'Audi A6', 'Wagon','12500','11500', '20');
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('16', 'VolksWagen Passat', 'Sedan','7200','5200', '20');
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('17', 'Renault Master', 'Bus','17900','9200', '20');
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('18', 'Nissan Micra', 'Cabrio','9900','8800', '20');
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('19', 'FSO Polonez', 'Hatchback','1200','1000', '20');
INSERT INTO cars (id, car_model, body_type, selling_price, purchase_price, tax_rate)
VALUES ('20', 'Dacia Logan', 'Sedan','400','200', '20');

/*After correct input of the data, I approve operations with commit*/
COMMIT;

/*Creating  table "body_types" with the appropriate constraints*/
CREATE TABLE body_types
	(
	body_type VARCHAR2(3) PRIMARY KEY,
	full_name VARCHAR(20) NOT NULL,
	discount NUMBER,
	car_registered VARCHAR2(1) CHECK (car_registered in ('Y', 'N'))
	);
	
/*Introducing short names for body types*/
UPDATE cars
SET body_type = 'CAB'
WHERE  body_type = 'Cabrio';

UPDATE cars
SET body_type = 'SED'
WHERE  body_type = 'Sedan';

UPDATE cars
SET body_type = 'BUS'
WHERE  body_type = 'Bus';

UPDATE cars
SET body_type = 'HAT'
WHERE  body_type = 'Hatchback';

UPDATE cars
SET body_type = 'WAG'
WHERE  body_type = 'Wagon';

COMMIT;

/*Entering the data into the "body_types" table*/
INSERT INTO body_types (body_type, full_name, discount, car_registered)
VALUES('CAB','Cabrio',null,'Y');
INSERT INTO body_types (body_type, full_name, discount, car_registered)
VALUES('SED','Sedan',null,'Y');
INSERT INTO body_types (body_type, full_name, discount, car_registered)
VALUES('BUS','Bus',null,'Y');
INSERT INTO body_types (body_type, full_name, discount, car_registered)
VALUES('HAT','Hatchback',null,'Y');
INSERT INTO body_types (body_type, full_name, discount, car_registered)
VALUES('WAG','Wagon',null,'Y');

COMMIT;

/*Adding the foreign key to the "cars" table*/
ALTER TABLE cars
ADD CONSTRAINT fk_body_type FOREIGN KEY (body_type)
REFERENCES body_types(body_type);

/*Creating  table "reason_for_the_absence" with the appropriate constraints*/
CREATE TABLE reason_for_the_absence
		(
		ID NUMBER PRIMARY KEY,
		name_ VARCHAR2(200) not null,
		agree VARCHAR2(1) DEFAULT 'N',
		notes VARCHAR2(1500)
		);
		
/*Entering the data into the "reason_for_the_absence" table*/
INSERT INTO reason_for_the_absence (id, name_, agree, notes)
VALUES(1,'Maternity leave', 'Y', null);
INSERT INTO reason_for_the_absence (id, name_, agree, notes)
VALUES(2,'Paternity leave', 'N', null);
INSERT INTO reason_for_the_absence (id, name_, agree, notes)
VALUES(3,'Parental leave', 'Y', null);
INSERT INTO reason_for_the_absence (id, name_, agree, notes)
VALUES(4,'Vacation leave', 'Y', null);
INSERT INTO reason_for_the_absence (id, name_, agree, notes)
VALUES(5,'Training leave', 'N', null);
INSERT INTO reason_for_the_absence (id, name_, agree, notes)
VALUES(6,'vacation on request', 'Y', null);
INSERT INTO reason_for_the_absence (id, name_, agree, notes)
VALUES(7,'Unpaid leave', 'N', null);

COMMIT;

		
/*Creating  table "absences" with the appropriate constraints*/
		CREATE TABLE absences
		(
		ID NUMBER PRIMARY KEY,
		worker_id NUMBER REFERENCES workers(id),
		RFTA_code NUMBER REFERENCES reason_for_the_absence(id),
		date_from DATE,
		date_to DATE
		);
		
/*Entering the data into the "absences" table*/
INSERT INTO absences (id, worker_id, RFTA_code, date_from, date_to)
VALUES(1,10,1,to_date('21/09/04','RR/MM/DD'), to_date('21/10/05','RR/MM/DD'));
INSERT INTO absences (id, worker_id, RFTA_code, date_from, date_to)
VALUES(2,7,3,to_date('21/10/07','RR/MM/DD'), to_date('21/10/20','RR/MM/DD'));
INSERT INTO absences (id, worker_id, RFTA_code, date_from, date_to)
VALUES(3,1,6,to_date('22/01/06','RR/MM/DD'), to_date('22/06/05','RR/MM/DD'));
INSERT INTO absences (id, worker_id, RFTA_code, date_from, date_to)
VALUES(4,4,5,to_date('22/04/01','RR/MM/DD'), to_date('22/06/02','RR/MM/DD'));
INSERT INTO absences (id, worker_id, RFTA_code, date_from, date_to)
VALUES(5,2,7,to_date('22/08/12','RR/MM/DD'), to_date('22/10/15','RR/MM/DD'));

COMMIT;

/*Creating table "customers" with the appropriate constraints*/
CREATE TABLE customers
	(
	ID NUMBER PRIMARY KEY,
	first_name VARCHAR2(30) NOT NULL,
	last_name VARCHAR2(40) NOT NULL,
	PESEL VARCHAR2(11),
	post_code VARCHAR2(10),
	city VARCHAR2(40)
	);
	
/*Entering the data into the "customers" table*/
INSERT INTO customers(id, first_name, last_name, PESEL, post_code, city)
VALUES(1, 'Aaron','Lasti','99120411111','54-905','Small Town');
INSERT INTO customers(id, first_name, last_name, PESEL, post_code, city)
VALUES(2, 'Michael','Knight','98021411111','24-935','Big Town');
INSERT INTO customers(id, first_name, last_name, PESEL, post_code, city)
VALUES(3, 'Anna','Lopez','92050311111','58-105','Medium Town');
INSERT INTO customers(id, first_name, last_name, PESEL, post_code, city)
VALUES(4, 'Artur','Chlop','89120411111','14-901','Mountain Land');
INSERT INTO customers(id, first_name, last_name, PESEL, post_code, city)
VALUES(5, 'Lisa','Mona','88121411111','34-333','Sun Land');
INSERT INTO customers(id, first_name, last_name, PESEL, post_code, city)
VALUES(6, 'Koko','De la Fu','56120411111','44-105','Nova Land');

COMMIT;

/*Creating  table "invoices" with the appropriate constraints*/
CREATE TABLE invoices
(
invoice_id NUMBER PRIMARY KEY,
invoice_date DATE,
customer_id NUMBER REFERENCES customers(id),
the_net_value NUMBER,
gross_value NUMBER,
tax_rate NUMBER,
currency VARCHAR2(3)
);

/*Entering the data into the "invoices" table*/
INSERT INTO invoices
VALUES (1, to_date('2022-01-02','YYYY-MM-DD'),3,10000,12000,20,'EUR');

COMMIT;










--Sample queries--


--Deleting the table for example "cars"
DROP TABLE cars;

--Deleting all records, for example  from the "invoices" table
DELETE
FROM invoices;

--Deleting the whole table, for example  the "customers" table
DROP TABLE customers;

--Selecting all data from the "cars" table
SELECT *
FROM cars;

--The "update" command allows you to add or correct  data in the appropriate field. In this case we corrected the mistake by inserting "BMW 335D instead BMW335i
UPDATE cars
SET car_model = 'BMW 335D'
WHERE id = 14;

--Average car price
SELECT AVG(selling_price)
FROM cars;

--How to check how many cars there are with a given body type
SELECT body_type, count(*)
FROM cars
GROUP BY body_type;

--Total earnings of men and women
SELECT sex, sum(salary)
FROM workers
GROUP BY sex;


--How to get data on which employee is the manager of which department
SELECT department_name, id, manager_id, first_name, last_name
FROM departments
JOIN workers ON departments.manager_id = workers.id;

--Average salary of an employee with rounding to 2 decimal places
SELECT first_name, last_name, salary, (select round(avg(salary), 2) from workers) average
FROM workers;






		






	

