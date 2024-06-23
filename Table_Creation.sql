CREATE DATABASE `buyhub`;
commit;

USE buyhub;

/*Create table for Customer with attributes such as customer ID, First name, Last name, Last login, 
password,address, ISD, phone number*/
CREATE TABLE `CUSTOMER` 
  `CUSTOMER_ID` bigint NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(50) NOT NULL,
  `LAST_NAME` varchar(50) NOT NULL,
  `LAST_LOGIN` timestamp,
  `PASSWORD` varchar(20) NOT NULL,
  `ADDRESS` varchar(100) NOT NULL,
  `ISD` bigint,
  `PHONE_NO` bigint,
  PRIMARY KEY (`CUSTOMER_ID`)
);


 /*Create table for Product with attributes such as product Id, product name, description, supplier, 
 price, category, images, tags, comments*/
CREATE TABLE `PRODUCT` (
  `PRODUCT_ID` bigint NOT NULL AUTO_INCREMENT,
  `PRODUCT_NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(50) NOT NULL,
  `SUPPLIER` varchar(50) NOT NULL,
  `PRICE` int,
  `IMAGES` BLOB,
  `TAGS` varchar(100),
  `COMMENTS` varchar(200),
  PRIMARY KEY (`PRODUCT_ID`)
);

/* Create a table for Category with attributes such as category Id, product Id, description */
CREATE TABLE `CATEGORY`(
	`CATEGORY_ID` bigint NOT NULL AUTO_INCREMENT,
	`PRODUCT_ID` bigint NOT NULL,
	`DESCRIPTION` varchar(50),
	PRIMARY KEY(`CATEGORY_ID`),
	CONSTRAINT `CATEGORY_PRODUCT_FK` FOREIGN KEY(`PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`)
);


/*Create table for Order with attributes such as order Id, order owner Id, order quantity, order amount,
 * description, date*/
CREATE TABLE `ORDERS` (
  `ORDER_ID` bigint NOT NULL AUTO_INCREMENT,
  `ORDER_OWNER_ID` bigint  NOT NULL,
  `ORDER_QUANTITY` varchar(50) NOT NULL,
  `ORDER_AMOUNT` float DEFAULT NULL,
  `DESCRIPTION` varchar(50) NOT NULL,
  `DATE` date DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  CONSTRAINT `ORDER_CUSTOMER_FK` FOREIGN KEY (`ORDER_OWNER_ID`) REFERENCES `CUSTOMER` (`CUSTOMER_ID`)
);


/*Create table for Supplier with attribute such as supplier Id, supplier name, email, phone number*/
CREATE TABLE `SUPPLIER`(
	`SUPPLIER_ID` bigint NOT NULL,
	`PRODUCT_ID` bigint NOT NULL,
	`SUPPLIER_NAME` varchar(50) NOT NULL,
	`EMAIL` varchar(50),
	`PHONE_NO` bigint,
	PRIMARY KEY(`SUPPLIER_ID`),
	CONSTRAINT `SUPPLIER_ID_FK` FOREIGN KEY(`PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`)
	
);

/*Create table for Order Items with attributes such as order item Id, order Id, product Id,unit price,
 * description, quantity */
CREATE TABLE `ORDER_ITEMS`(
	`ORDER_ITEMS_ID` bigint NOT NULL ,
	`ORDER_ID` bigint NOT NULL ,
	`PRODUCT_ID`  bigint NOT NULL,
	`SUPPLIER_ID` bigint NOT NULL,
	`UNIT_PRICE` float,
	`DESCRIPTION`varchar(50) NOT NULL,
	`QUANTITY` int,
	PRIMARY KEY(`ORDER_ITEMS_ID`),
	CONSTRAINT `ORDER_ID_FK` FOREIGN KEY (`ORDER_ID`) REFERENCES `ORDERS` (`ORDER_ID`),
	CONSTRAINT `PRODUCT_ID_FK` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`),
	CONSTRAINT `ORDER_SUPPLIER_FK` FOREIGN KEY(`SUPPLIER_ID`)REFERENCES `SUPPLIER`(`SUPPLIER_ID`)
);


/*Create table for Return with attributes such as return Id, order items Id, quantity, return date, description*/
CREATE TABLE `RETURN`(
	`RETURN_ID` bigint NOT NULL AUTO_INCREMENT,
	`ORDER_ITEMS_ID` bigint NOT NULL,
	`QUANTITY` int,
	`RETURN_DATE` datetime NOT NULL,
	`DESCRIPTION` varchar(50),
	PRIMARY KEY(`RETURN_ID`),
	CONSTRAINT `RETURN_ID_FK` FOREIGN KEY (`ORDER_ITEMS_ID`) REFERENCES `ORDER_ITEMS` (`ORDER_ITEMS_ID`)
);

 

