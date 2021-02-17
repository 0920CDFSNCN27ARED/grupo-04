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
	phoneNumber VARCHAR(20),
	avatar VARCHAR(50),
	userCategoryId INT UNSIGNED NOT NULL,
	isBanned TINYINT UNSIGNED NOT NULL,
	createdAt DATETIME DEFAULT CURRENT_TIMESTAMP ,
	updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (userCategoryId) references userCategories(id)
);

insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (1, 'Giana', 'Maliphant', 'gmaliphant0@ebay.com', 'NVHkryudE', 'Saint Louis', 'Missouri', 'Park Meadow', '6404', 6, "A", '314-384-3956', 'NuncProinAt.tiff', 1, 0);
insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (2, 'Delmore', 'Hansana', 'dhansana1@last.fm', 'WpO1GGrq', 'San Antonio', 'Texas', 'Cordelia', '380', 20, "B", '210-562-4264', 'Odio.tiff', 2, 0);
insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (3, 'Reinhard', 'Wederell', 'rwederell2@jigsy.com', 'JryhJlA', 'New Castle', 'Pennsylvania', 'Village', '14716', 10, "C", '724-376-9424', 'Aenean.tiff', 2, 1);
insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (4, 'Heath', 'Tincombe', 'htincombe3@engadget.com', '4gBEvlI9mxNd', 'Arlington', 'Virginia', 'Del Mar', '7494', 12, "D", '703-530-9202', 'AliquetAtFeugiat.tiff', 2, 0);
insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (5, 'Virgilio', 'Leverentz', 'vleverentz4@topsy.com', 'kKVimU', 'Savannah', 'Georgia', 'Dixon', '2', 14, "A", '912-398-3613', 'Nunc.jpeg', 1, 1);
insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (6, 'Nona', 'Fladgate', 'nfladgate5@opensource.org', 'x8k8asZ', 'Laredo', 'Texas', 'Warner', '5120', NULL, NULL, '956-298-2610', 'CurabiturConvallisDuis.tiff', 1, 1);
insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (7, 'Findlay', 'Stookes', 'fstookes6@wisc.edu', 'hzdKM33Iv7', 'Pasadena', 'California', 'Farragut', '23', 8, "F", '626-775-4300', 'LoremIntegerTincidunt.gif', 2, 1);
insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (8, 'Skelly', 'Filippov', 'sfilippov7@diigo.com', 'O4vUMx2i', 'Grand Rapids', 'Michigan', 'Oak', '71', 14, "B", '616-949-3774', 'ConsequatLectus.tiff', 1, 1);
insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (9, 'Sheila-kathryn', 'Lippini', 'slippini8@cbc.ca', 'gDm3B5', 'Phoenix', 'Arizona', 'Gerald', '552', 7, "C", '602-151-2611', 'Velit.tiff', 1, 1);
insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (10, 'Sauveur', 'Gadie', 'sgadie9@newsvine.com', 'fplQHB3rdzC6', 'Austin', 'Texas', '5th', '8', 1, "A", '512-179-6710', 'Lobortis.jpeg', 1, 1);
insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (11, 'Ivory', 'Croser', 'icrosera@vk.com', 'pBySWRoXRJ', 'Worcester', 'Massachusetts', 'Dorton', '48842', NULL, NULL, '508-613-2107', 'AmetSapienDignissim.jpeg', 1, 1);
insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (12, 'Jan', 'Brownell', 'jbrownellb@lulu.com', 'X4jXuK08F', 'Orlando', 'Florida', 'Di Loreto', '7', 1, "D", '321-409-7996', 'AmetNuncViverra.tiff', 2, 1);
insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (13, 'Kippy', 'Pettingall', 'kpettingallc@is.gd', 'VWT4xqejQ', 'Louisville', 'Kentucky', 'Sutteridge', '9569', 15, "B", '502-584-1046', 'PotentiInEleifend.jpeg', 1, 0);
insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (14, 'Georgine', 'Gilhouley', 'ggilhouleyd@woothemes.com', 'bjEq6Voc3nXq', 'Jefferson City', 'Missouri', 'Sugar', '07', 11, "C", '573-253-1721', 'NibhFusceLacus.jpeg', 2, 0);
insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (15, 'Waverley', 'Warlawe', 'wwarlawee@opensource.org', 'njdPaxCPV', 'Greenville', 'South Carolina', 'Menomonie', '697', NULL, NULL, '864-493-9940', 'UtDolor.tiff', 1, 0);
insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (16, 'Kenneth', 'Pilsbury', 'kpilsburyf@soundcloud.com', 'nr2tyXf', 'Aurora', 'Colorado', 'Bultman', '25', 11, "B", '303-616-3160', 'Nulla.tiff', 1, 1);
insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (17, 'Merlina', 'Goggen', 'mgoggeng@wunderground.com', '6rylqA1gqvAF', 'Charleston', 'West Virginia', 'Donald', '421', 15, "D", '304-676-2051', 'AnteIpsum.jpeg', 1, 0);
insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (18, 'Jeannie', 'Geertz', 'jgeertzh@de.vu', 'vWjqisPhg4', 'Boynton Beach', 'Florida', 'Shopko', '82', 4, "B", '561-930-9190', 'InFaucibusOrci.jpeg', 1, 0);
insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (19, 'Arman', 'Leneve', 'alenevei@scribd.com', 'QCqGzR', 'Lexington', 'Kentucky', 'Colorado', '42110', 12, "A", '859-210-2078', 'Morbi.jpeg', 1, 0);
insert into users (id, firstName, lastName, email, password, city, state, street, houseNumber, floor, apartment, phoneNumber, avatar, userCategoryId, isBanned) values (20, 'Caroline', 'Harkins', 'charkinsj@51.la', 'kusSXfB0h', 'South Bend', 'Indiana', 'Parkside', '20', 12, "C", '574-875-6366', 'QuisAugueLuctus.tiff', 1, 1);

-- -----------------
-- productCategories
-- -----------------

CREATE TABLE productCategories (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL
);

INSERT INTO productCategories VALUES
(DEFAULT, "Alimentos y bebidas"),
(DEFAULT, "Antiguedades"),
(DEFAULT, "Arte, Libreria y Merceria"),
(DEFAULT, "Automotores"),
(DEFAULT, "Bebes"),
(DEFAULT, "Belleza y Cuidado Personal"),
(DEFAULT, "Camaras y Accesorios"),
(DEFAULT, "Celulares y Telefonos"),
(DEFAULT, "Computacion"),
(DEFAULT, "Consolas y Videojuegos"),
(DEFAULT, "Deportes y Fitness"),
(DEFAULT, "Electrodomesticos"),
(DEFAULT, "Electronica, Audio y Video"),
(DEFAULT, "Herramientas y Construccion"),
(DEFAULT, "Hogar, Muebles y Jardin"),
(DEFAULT, "Instrumentos Musicales"),
(DEFAULT, "Joyas y Relojes"),
(DEFAULT, "Juegos y Jueguetes"),
(DEFAULT, "Libros, Revistas y Comics"),
(DEFAULT, "Musica, Peliculas y Series"),
(DEFAULT, "Ropa y Accesorios"),
(DEFAULT, "Souvenirs, Cotillon y Fiestas"),
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

insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (1, 'Versatainer Nc - 8288', 19090, 'sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum', 'Mhlume', 'AtNibh.png', 2, 0, 7);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (2, 'Ham - Cooked Bayonne Tinned', 10442, 'vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla', 'Mianduhe', 'JustoAliquam.jpeg', 8, 1, 22);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (3, 'Cheese - Brie, Cups 125g', 8077, 'vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at', 'Tiarei', 'NonInterdum.tiff', 6, 1, 15);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (4, 'Crab Brie In Phyllo', 19364, 'in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi', 'Cáchira', 'Amet.jpeg', 4, 0, 22);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (5, 'Propel Sport Drink', 4493, 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent', 'Xinqiaohe', 'IntegerTinciduntAnte.png', 6, 1, 7);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (6, 'Longos - Assorted Sandwich', 11975, 'gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec', 'Almelo', 'VelEnimSit.png', 5, 1, 17);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (7, 'Bread - Malt', 18207, 'placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut', 'Kut Chap', 'LuctusTincidunt.png', 10, 0, 14);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (8, 'Soup - French Onion', 13398, 'penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec', 'Arlington', 'Mauris.jpeg', 10, 0, 1);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (9, 'Crab - Dungeness, Whole, live', 1897, 'sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius', 'Xianzong', 'ConvallisDuisConsequat.jpeg', 8, 1, 17);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (10, 'Tequila - Sauza Silver', 11586, 'ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed', 'Guanting', 'Sit.png', 2, 0, 7);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (11, 'Truffle - Whole Black Peeled', 18730, 'in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec', 'Krajan', 'TinciduntIn.tiff', 3, 1, 9);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (12, 'Cabbage - Nappa', 16397, 'justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst', 'Arroyo Seco', 'EtiamFaucibusCursus.tiff', 10, 1, 1);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (13, 'Wine - Carmenere Casillero Del', 2912, 'in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed', 'Fenghuang', 'MorbiNonQuam.png', 10, 1, 22);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (14, 'Buffalo - Tenderloin', 3165, 'gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis', 'Notranje Gorice', 'IdLuctus.jpeg', 6, 1, 10);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (15, 'Wine - Ej Gallo Sierra Valley', 2296, 'est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum', 'Bindura', 'Ridiculus.jpeg', 7, 1, 11);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (16, 'Beef - Flank Steak', 18727, 'et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor', 'Nalinggou', 'Tempor.gif', 10, 0, 1);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (17, 'Turkey - Whole, Fresh', 18605, 'turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi', 'Bordeaux', 'PurusAliquetAt.gif', 9, 1, 14);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (18, 'Wine - Cave Springs Dry Riesling', 6140, 'ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium', 'Kolomak', 'QuisquePortaVolutpat.tiff', 3, 1, 8);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (19, 'Napkin - Dinner, White', 9719, 'euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus', 'Presidente Epitácio', 'LiberoRutrumAc.gif', 3, 1, 13);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (20, 'Spice - Pepper Portions', 661, 'mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in', 'Staraya Mayna', 'QuamSapienVarius.jpeg', 1, 1, 10);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (21, 'Hinge W Undercut', 19253, 'curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et', 'Karasuk', 'APede.gif', 5, 0, 20);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (22, 'Brandy Cherry - Mcguinness', 5772, 'vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo', 'Longhe', 'ImperdietNullamOrci.jpeg', 5, 0, 19);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (23, 'Beer - Molson Excel', 6677, 'eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget', 'Lingyang', 'Risus.tiff', 6, 0, 12);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (24, 'Tilapia - Fillets', 16362, 'augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in', 'Zaqatala', 'Id.gif', 4, 1, 7);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (25, 'Muffin Carrot - Individual', 10083, 'augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales', 'Fenghuang', 'QuisqueId.tiff', 6, 1, 18);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (26, 'Sword Pick Asst', 18035, 'non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede', 'Ku‘aydinah', 'EratVolutpatIn.tiff', 1, 1, 10);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (27, 'Bread Roll Foccacia', 14189, 'integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean', 'Bozoum', 'ParturientMontes.tiff', 3, 1, 8);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (28, 'Truffle Cups Green', 1673, 'donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante', 'Karma', 'AdipiscingElitProin.gif', 6, 1, 22);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (29, 'Pepsi - 600ml', 10536, 'sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam', 'Tuy Phươ�?c', 'VestibulumQuamSapien.tiff', 5, 0, 8);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (30, 'Lid - 0090 Clear', 15499, 'eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam', 'Jiamiao', 'EtiamFaucibusCursus.jpeg', 5, 0, 9);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (31, 'Cheese - Wine', 4589, 'eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis', 'Argivai', 'Mauris.png', 9, 1, 22);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (32, 'Artichokes - Knobless, White', 3276, 'nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est', 'Placer', 'SodalesSed.jpeg', 5, 0, 20);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (33, 'Gherkin - Sour', 11212, 'nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam', 'Frutillar', 'NullaSedVel.png', 5, 1, 7);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (34, 'Pie Shell - 5', 8571, 'consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum', 'Karangsari', 'SitAmet.gif', 3, 1, 13);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (35, 'Spice - Peppercorn Melange', 16309, 'sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien', 'Linamon', 'DapibusDuis.tiff', 1, 1, 23);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (36, 'Tarragon - Primerba, Paste', 8240, 'ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue', 'Layog', 'Massa.tiff', 4, 1, 8);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (37, 'Container Clear 8 Oz', 5211, 'morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat', 'Bentar', 'LobortisSapien.png', 6, 0, 16);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (38, 'Canadian Emmenthal', 17361, 'orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac', 'Sibulan', 'Pede.gif', 3, 0, 14);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (39, 'Anchovy In Oil', 12829, 'volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio', 'Al Ḩar�?k', 'Dapibus.tiff', 9, 1, 23);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (40, 'Beer - Guiness', 12938, 'lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl', 'Ngedhusuba', 'Condimentum.tiff', 1, 1, 5);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (41, 'Onions - Cippolini', 12613, 'dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti', 'Gunungangka', 'CurabiturInLibero.gif', 1, 1, 1);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (42, 'Tomatoes - Hot House', 1337, 'congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum', 'Santo Amaro', 'Sed.tiff', 2, 0, 18);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (43, 'Straws - Cocktale', 2620, 'amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque', 'Qobu', 'Lectus.jpeg', 8, 1, 5);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (44, 'Nantucket Orange Juice', 7304, 'praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede', 'Tais', 'Ultrices.tiff', 5, 1, 1);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (45, 'Buffalo - Striploin', 9126, 'nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum', 'Azurva', 'Odio.png', 9, 0, 2);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (46, 'Beef - Cooked, Corned', 596, 'suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate', 'Hamilton', 'Lobortis.png', 6, 0, 2);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (47, 'Grapes - Green', 528, 'in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam', 'Buliran', 'VestibulumSedMagna.gif', 4, 1, 1);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (48, 'Apple - Royal Gala', 12162, 'orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed', 'Mersa Matruh', 'MagnaBibendum.tiff', 4, 0, 8);
insert into products (id, name, price, description, city, image, stock, isBanned, productCategoryId) values (49, 'Kaffir Lime Leaves', 18283, 'accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet', 'Resplendor', 'MiInteger.gif', 8, 0, 10);


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

insert into orders (id, orderStatusId, userId, paymentMethodId) values (1, 3, 1, 6);
insert into orders (id, orderStatusId, userId, paymentMethodId) values (2, 5, 2, 2);
insert into orders (id, orderStatusId, userId, paymentMethodId) values (3, 5, 2, 1);
insert into orders (id, orderStatusId, userId, paymentMethodId) values (4, 4, 1, 1);
insert into orders (id, orderStatusId, userId, paymentMethodId) values (5, 5, 2, 4);
insert into orders (id, orderStatusId, userId, paymentMethodId) values (6, 4, 1, 6);
insert into orders (id, orderStatusId, userId, paymentMethodId) values (7, 5, 1, 4);
insert into orders (id, orderStatusId, userId, paymentMethodId) values (8, 3, 1, 5);
insert into orders (id, orderStatusId, userId, paymentMethodId) values (9, 3, 2, 2);
insert into orders (id, orderStatusId, userId, paymentMethodId) values (10, 3, 2, 4);
insert into orders (id, orderStatusId, userId, paymentMethodId) values (11, 5, 1, 5);
insert into orders (id, orderStatusId, userId, paymentMethodId) values (12, 3, 2, 3);
insert into orders (id, orderStatusId, userId, paymentMethodId) values (13, 4, 2, 4);
insert into orders (id, orderStatusId, userId, paymentMethodId) values (14, 3, 2, 4);
insert into orders (id, orderStatusId, userId, paymentMethodId) values (15, 3, 2, 5);
insert into orders (id, orderStatusId, userId, paymentMethodId) values (16, 1, 2, 3);
insert into orders (id, orderStatusId, userId, paymentMethodId) values (17, 1, 2, 5);
insert into orders (id, orderStatusId, userId, paymentMethodId) values (18, 5, 1, 6);
insert into orders (id, orderStatusId, userId, paymentMethodId) values (19, 1, 2, 3);
insert into orders (id, orderStatusId, userId, paymentMethodId) values (20, 2, 1, 5);


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

insert into product_order (id, orderId, productId, itemPrice, quantity) values (1, 7, 28, 2273, 4);
insert into product_order (id, orderId, productId, itemPrice, quantity) values (2, 9, 49, 13056, 3);
insert into product_order (id, orderId, productId, itemPrice, quantity) values (3, 15, 25, 5254, 5);
insert into product_order (id, orderId, productId, itemPrice, quantity) values (4, 5, 33, 15232, 5);
insert into product_order (id, orderId, productId, itemPrice, quantity) values (5, 14, 26, 7760, 4);
insert into product_order (id, orderId, productId, itemPrice, quantity) values (6, 14, 15, 2145, 4);
insert into product_order (id, orderId, productId, itemPrice, quantity) values (7, 18, 39, 14472, 4);
insert into product_order (id, orderId, productId, itemPrice, quantity) values (8, 1, 29, 18288, 3);
insert into product_order (id, orderId, productId, itemPrice, quantity) values (9, 2, 37, 15336, 4);
insert into product_order (id, orderId, productId, itemPrice, quantity) values (10, 17, 1, 949, 4);
insert into product_order (id, orderId, productId, itemPrice, quantity) values (11, 14, 8, 8295, 3);
insert into product_order (id, orderId, productId, itemPrice, quantity) values (12, 18, 22, 4378, 3);
insert into product_order (id, orderId, productId, itemPrice, quantity) values (13, 3, 22, 19521, 4);
insert into product_order (id, orderId, productId, itemPrice, quantity) values (14, 19, 4, 8688, 3);
insert into product_order (id, orderId, productId, itemPrice, quantity) values (15, 16, 27, 16740, 1);
insert into product_order (id, orderId, productId, itemPrice, quantity) values (16, 18, 31, 8378, 2);
insert into product_order (id, orderId, productId, itemPrice, quantity) values (17, 8, 43, 1902, 1);
insert into product_order (id, orderId, productId, itemPrice, quantity) values (18, 16, 25, 3118, 4);
insert into product_order (id, orderId, productId, itemPrice, quantity) values (19, 17, 20, 17783, 3);
insert into product_order (id, orderId, productId, itemPrice, quantity) values (20, 4, 5, 7621, 5);

