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
