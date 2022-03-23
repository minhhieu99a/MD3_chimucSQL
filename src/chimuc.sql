# Chỉ mục SQL
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';
SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';
ALTER TABLE customers ADD INDEX idx_customerName(customerName);
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';
ALTER TABLE customers ADD INDEX  idx_full_name(contactFirstName, contactLastName);
Explain SELECT *FROM customers WHERE contactFirstName ='Jean' or contactFirstName = 'King';
ALTER TABLE customers DROP INDEX idx_full_name;

# Store Procedure
DELIMITER $$
CREATE PROCEDURE findAllCustomers()
BEGIN
    SELECT *FROM customers;
end $$
DELIMITER ;

call findAllCustomers();

DELIMITER $$
DROP PROCEDURE IF EXISTS `findAllCustomers`$$
CREATE PROCEDURE findAllCustomers()

BEGIN
    SELECT *FROM customers WHERE customerNumber=175;
end $$

# Store ProcedureINOUT

DELIMITER $$
CREATE PROCEDURE getCusById(IN cusNum INT(11))
BEGIN
    SELECT *FROM customers WHERE customerNumber =cusNum;
end $$

call getCusById(175);

DELIMITER $$
CREATE PROCEDURE getCusCountByCity(
IN in_city VARCHAR(50),
OUT  total INT
)
BEGIN
    SELECT count(customerNumber)
        INTO total
    FROM customers
        WHERE city =in_city;
end $$

CALL getCusCountByCity('Lyon',@total);

SELECT @total;

# Inout
DELIMITER $$
CREATE PROCEDURE SetCounter(
INOUT counter INT,
IN inc INT
)
BEGIN
    SET counter =counter+inc;
end $$

SET @counter =1;
CALL SetCounter(@counter,1);
CALL SetCounter(@counter,4);
CALL SetCounter(@counter,3);
SELECT @counter;


# view
Create VIEW customer_views AS
    SELECT customerNumber,customerName,phone
FROM customers;
SELECT *from customer_views;

CREATE OR REPLACE VIEW customer_views As
    SELECT customerNumber, customerName, contactFirstName, contactLastName, phone
from customers
WHERE city ='Nantes';
