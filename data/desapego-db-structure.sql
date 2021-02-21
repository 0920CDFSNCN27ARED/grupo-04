DROP DATABASE IF EXISTS desapego_db;
CREATE DATABASE IF NOT EXISTS desapego_db;
USE desapego_db;

-- --------------
-- userCategories
-- --------------

CREATE TABLE userCategories (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL
);

/*
 * TO DO create table states and cities 
 */

-- -----
-- users
-- -----

CREATE TABLE users (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	firstName VARCHAR(40) NOT NULL,
	lastName VARCHAR(40) NOT NULL,
	email VARCHAR(50) NOT NULL,
	password VARCHAR(40) NOT NULL,
	city VARCHAR(50) NOT NULL, -- TO DO connect with table cities --
	state VARCHAR(30) NOT NULL, -- TO DO delete when the connection with table cities be done --
	street VARCHAR(50) NOT NULL,
	houseNumber SMALLINT UNSIGNED NOT NULL,
	floor VARCHAR(2),
	apartment VARCHAR(3),
	phoneNumber VARCHAR(20) NOT NULL,
	avatar VARCHAR(50) NOT NULL,
	categoryId INT UNSIGNED NOT NULL DEFAULT 2,
	isBanned TINYINT UNSIGNED NOT NULL DEFAULT 0,
	createdAt DATETIME DEFAULT CURRENT_TIMESTAMP ,
	updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (categoryId) references userCategories(id)
);


-- -----------------
-- productCategories
-- -----------------

CREATE TABLE productCategories (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL
);


-- --------
-- products
-- --------

CREATE TABLE products (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50),
	price INT UNSIGNED NOT NULL,
	description VARCHAR(1500),
	image VARCHAR(50),
	stock SMALLINT UNSIGNED NOT NULL,
	isBanned TINYINT UNSIGNED NOT NULL DEFAULT 0,
	categoryId INT UNSIGNED NOT NULL,
	userId INT UNSIGNED NOT NULL,
	createdAt DATETIME DEFAULT CURRENT_TIMESTAMP ,
	updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (categoryId) REFERENCES productCategories(id),
	FOREIGN KEY (userId) REFERENCES users(id)	
);

-- --------------
-- paymentMethods
-- --------------

CREATE TABLE paymentMethods (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL
);


-- -------------
-- orderStatuses
-- -------------

CREATE TABLE orderStatuses (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL
);


-- ------
-- orders
-- ------

CREATE TABLE orders (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	statusId INT UNSIGNED NOT NULL,
	userId INT UNSIGNED NOT NULL,
	paymentMethodId INT UNSIGNED NOT NULL,
	createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
	updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (statusId) REFERENCES orderStatuses(id),
	FOREIGN KEY (userId) REFERENCES users(id),
	FOREIGN KEY (paymentMethodId) REFERENCES paymentMethods(id)
);


-- -------------
-- order_product
-- -------------

CREATE TABLE order_product (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	orderId INT UNSIGNED NOT NULL,
	productId INT UNSIGNED NOT NULL,
	itemPrice INT UNSIGNED NOT NULL,
	quantity SMALLINT UNSIGNED NOT NULL,
	FOREIGN KEY (orderId) REFERENCES orders(id),
	FOREIGN KEY (productId) REFERENCES products(id)
);

