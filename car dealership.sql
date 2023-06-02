CREATE TABLE salesperson(
salesperson_id INT PRIMARY KEY,
full_name VARCHAR(150),
email VARCHAR(150)
);

CREATE TABLE customer(
customer_id INT PRIMARY KEY,
full_name VARCHAR(150),
email VARCHAR(150)
);

CREATE TABLE car(
car_serial INT PRIMARY KEY,
make  VARCHAR(150),
model VARCHAR(150),
prod_year INT
);

CREATE TABLE invoice(
invoice_id INT PRIMARY KEY,
salesperson_id INT,
car_serial INT,
total INT,
FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id),
FOREIGN KEY (car_serial) REFERENCES car(car_serial)
);

CREATE TABLE mechanic(
mechanic_id INT PRIMARY KEY,
full_name VARCHAR(150),
email VARCHAR(150)
);

CREATE TABLE part(
part_id INT PRIMARY KEY,
part_name VARCHAR(150),
price INT 
);

CREATE TABLE tickets(
ticket_id INT PRIMARY KEY,
mechanic_id INT,
car_serial INT,
dates DATE,
part_id INT,
total INT,
FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id),
FOREIGN KEY (car_serial) REFERENCES car(car_serial),
FOREIGN KEY (part_id) REFERENCES part(part_id)
);


DELIMITER //
CREATE PROCEDURE add_salesperson(
IN id INT,
IN f_name VARCHAR(150),
IN email VARCHAR(150)
)

BEGIN
INSERT INTO salesperson(
salesperson_id,
full_name,
email
)
VALUES(
id,
f_name,
email);
END //
DELIMITER ;

CALL add_salesperson(1, 'Jordan Jones', 'j@car.com');
CALL add_salesperson(2, 'Jonh Wayne', 'jw@car.com');

DELIMITER //
CREATE PROCEDURE add_customer(
IN id INT,
IN f_name VARCHAR(150),
IN email VARCHAR(150)
)
BEGIN
INSERT INTO customer(
customer_id,
full_name,
email
)
VALUES(
id,
f_name,
email
);
END //
DELIMITER ;

CALL add_customer(1, 'Max Smith', 'ms@customer.com');
CALL add_customer(2,'Carl Aikens', 'ca@customer.com');

DELIMITER //

CREATE PROCEDURE add_invoice(
IN id INT,
IN sale_id INT,
IN car_num INT,
IN total INT
)
BEGIN
INSERT INTO invoice(
invoice_id,
salesperson_id,
car_serial,
total
)
VALUES(
id,
sale_id,
car_num,
total
);
END //

DELIMITER ;
SET FOREIGN_KEY_CHECKS=0;
CALL add_invoice(10,1,12,13);
CALL add_invoice(11,2,13,14);

DELIMITER //

CREATE PROCEDURE add_car(
IN car_num INT,
IN make VARCHAR(150),
IN model VARCHAR (150),
IN prod_year INT
)
BEGIN 
INSERT INTO car(
 car_serial,
 make, 
 model,
 prod_year
 )
 VALUES(
 car_num,
 make, 
 model,
 prod_year
 );
END //

DELIMITER ;

SET FOREIGN_KEY_CHECKS=0;
CALL add_car(12, 'Toyota', 'Camry', 2018);
CALL add_car(13, 'Honda', 'Accord', 2023);

DELIMITER //

CREATE PROCEDURE add_mechanic2(
IN mech_id INT,
IN f_name VARCHAR(150),
IN email VARCHAR(150)
)
BEGIN
INSERT INTO mechanic(
mechanic_id,
full_name,
email
)
VALUES(
mech_id,
f_name,
email
);
END //

DELIMITER ;

SET FOREIGN_KEY_CHECKS=0;
CALL add_mechanic2(1, 'Nikola Jokic', 'joker@nba.com');
CALL add_mechanic2(2,'James Harden', 'beard@gmail.com');

DELIMITER //

CREATE PROCEDURE add_part(
IN part_id INT,
IN part_name VARCHAR(150),
IN price INT
)
BEGIN 
INSERT INTO part(
part_id,
part_name,
price
)
VALUES(
part_id,
part_name,
price
);
END //

DELIMITER ;

CALL add_part(1,'tube', 25);
CALL add_part(2,'socket', 10);

DELIMITER //

CREATE PROCEDURE add_tickets(
IN ticket_id INT,
IN mechanic_id INT,
IN car_serial INT,
IN dates DATE,
IN part_id INT,
IN total INT
)
BEGIN
INSERT INTO tickets(
ticket_id,
mechanic_id,
car_serial,
dates,
part_id,
total
)
VALUES(
ticket_id,
mechanic_id,
car_serial,
dates,
part_id,
total
);
END //

DELIMITER ;

SET FOREIGN_KEY_CHECKS=0;
CALL add_tickets(1,1,12,'2023-06-01', 1,50);
CALL add_tickets(2,2,13,'2023-06-01',2,61);

