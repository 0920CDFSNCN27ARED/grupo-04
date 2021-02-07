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


INSERT INTO userCategories VALUES
(DEFAULT, "admin"),
(DEFAULT, "customer");

/*
 * TO DO create table states and cities 
 */

-- -----
-- users
-- -----

CREATE TABLE users (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	firstNames VARCHAR(40) NOT NULL,
	lastNames VARCHAR(40) NOT NULL,
	email VARCHAR(50) NOT NULL,
	password VARCHAR(40) NOT NULL,
	city VARCHAR(50) NOT NULL, -- TO DO connect with table cities --
	state VARCHAR(30) NOT NULL, -- TO DO delete when the connection with table cities be done --
	street VARCHAR(50) NOT NULL,
	houseNumber SMALLINT UNSIGNED NOT NULL,
	floor VARCHAR(2),
	apartment VARCHAR(3),
	phoneNumber VARCHAR(20),
	avatar VARCHAR(50),
	userCategoryId INT UNSIGNED NOT NULL,
	isBanned TINYINT UNSIGNED NOT NULL,
	createdAt DATETIME DEFAULT CURRENT_TIMESTAMP ,
	updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (userCategoryId) references userCategories(id)
);

/*
 * TO DO insert mockup on users 
 */


-- -----------------
-- productCategories
-- -----------------

CREATE TABLE productCategories (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL
);

INSERT INTO productCategories VALUES
(DEFAULT, "Alimentos y bebidas"),
(DEFAULT, "Antigüedades"),
(DEFAULT, "Arte, Librería y Mercería"),
(DEFAULT, "Automotores"),
(DEFAULT, "Bebés"),
(DEFAULT, "Belleza y Cuidado Personal"),
(DEFAULT, "Cámaras y Accesorios"),
(DEFAULT, "Celulares y Teléfonos"),
(DEFAULT, "Computación"),
(DEFAULT, "Consolas y Videojuegos"),
(DEFAULT, "Deportes y Fitness"),
(DEFAULT, "Electrodomésticos"),
(DEFAULT, "Electrónica, Audio y Video"),
(DEFAULT, "Herramientas y Construcción"),
(DEFAULT, "Hogar, Muebles y Jardín"),
(DEFAULT, "Instrumentos Musicales"),
(DEFAULT, "Joyas y Relojes"),
(DEFAULT, "Juegos y Jueguetes"),
(DEFAULT, "Libros, Revistas y Comics"),
(DEFAULT, "Música, Películas y Series"),
(DEFAULT, "Ropa y Accesorios"),
(DEFAULT, "Souvenirs, Cotillón y FIestas"),
(DEFAULT, "Varios");


-- --------
-- products
-- --------

CREATE TABLE products (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50),
	price INT UNSIGNED NOT NULL,
	description VARCHAR(1500),
	city VARCHAR(50) NOT NULL, -- TO DO connect with table cities --
	image VARCHAR(50),
	stock SMALLINT UNSIGNED NOT NULL,
	isBanned TINYINT UNSIGNED NOT NULL,
	productCategoryId INT UNSIGNED NOT NULL,
	createdAt DATETIME DEFAULT CURRENT_TIMESTAMP ,
	updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (productCategoryId) REFERENCES productCategories(id)	
);

/*
 * TO DO insert mockup on products 
 */

-- --------------
-- paymentMethods
-- --------------

CREATE TABLE paymentMethods (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL
);

INSERT INTO paymentmethods VALUES
(DEFAULT, "cash"),
(DEFAULT, "debit"),
(DEFAULT, "credit"),
(DEFAULT, "mercado pago"),
(DEFAULT, "bank transfer"),
(DEFAULT, "bitcoin");


-- -----------
-- orderStatus
-- -----------

CREATE TABLE orderStatus (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL
);

INSERT INTO orderstatus VALUES
(DEFAULT, "on cart"),
(DEFAULT, "paid"),
(DEFAULT, "delivered"),
(DEFAULT, "cancelled by buyer"),
(DEFAULT, "cancelled by seller");

-- ------
-- orders
-- ------

CREATE TABLE orders (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	orderStatusId INT UNSIGNED NOT NULL,
	userId INT UNSIGNED NOT NULL,
	paymentMethodId INT UNSIGNED NOT NULL,
	createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
	updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (orderStatusId) REFERENCES orderStatus(id),
	FOREIGN KEY (userId) REFERENCES users(id),
	FOREIGN KEY (paymentMethodId) REFERENCES paymentMethods(id)
);

/*
 * TO DO insert mockup on orders 
 */


-- -------------
-- product_order
-- -------------

CREATE TABLE product_order (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	orderId INT UNSIGNED NOT NULL,
	productId INT UNSIGNED NOT NULL,
	itemPrice INT UNSIGNED NOT NULL,
	quantity SMALLINT UNSIGNED NOT NULL,
	FOREIGN KEY (orderId) REFERENCES orders(id),
	FOREIGN KEY (productId) REFERENCES products(id)
);

/*
 * TO DO insert mockup on product_order 
 */

