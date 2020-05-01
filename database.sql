CREATE SCHEMA expressfood ;

DROP TABLE IF EXISTS customers;
CREATE TABLE customers(
`id` INT NOT NULL  AUTO_INCREMENT primary key,
`firstName` VARCHAR(30) NOT NULL,
`lastName` VARCHAR(50) NOT NULL,
`sex` enum ('male', 'female'),
`address` VARCHAR(30),
`phone` INT,
`email` VARCHAR(50),
`birthday` DATETIME default CURRENT_TIMESTAMP,
`media` VARCHAR(100) null
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS deliverers;
CREATE TABLE deliverers (
`id` INT NOT NULL AUTO_INCREMENT primary key,
`firstName` VARCHAR(30) NOT NULL,
`lastName` VARCHAR(50) NOT NULL,
`sex` enum ('male', 'female'),
`phone` INT NOT NULL,
`email` VARCHAR(50),
`birthday` DATETIME default CURRENT_TIMESTAMP,
`media` VARCHAR(100) null
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS menu;
CREATE TABLE menu (
  `id` INT NOT NULL AUTO_INCREMENT primary key,
  `name` VARCHAR(45) NOT NULL,
  `type` enum ('dish', 'desert') NOT NULL,
  `description` VARCHAR(100) NULL,
  `price` FLOAT(3,2) NOT NULL,
  `dow` ENUM ('monday', 'tuesday', 'wednesday', 'thrusday', 'friday', 'saturday', 'sunday'),
  `media` VARCHAR(200) null
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  `id` INT NOT NULL AUTO_INCREMENT primary key,
  `customerId` INT  NOT NULL,
  `delivererId` INT  NOT NULL,
  `dateTime` DATETIME,
  `status` enum ('do not delivered',  'delivered') DEFAULT 'do not delivered' NOT NULL,
  `total` FLOAT(3,2),
  `shippingAddress1` VARCHAR(200),
  `shippingAddress2` VARCHAR(200),
  `shippingCountry` VARCHAR(80),
  `shippingCity` VARCHAR(80),
  `shippingState` VARCHAR(80),
  `postalCode` VARCHAR(80),
  `paymentMethod` enum ('creditCard', 'cash'),
  FOREIGN KEY (customerId)
	REFERENCES customers(id)
	ON DELETE CASCADE,
  FOREIGN KEY (delivererId)
	REFERENCES deliverers(id)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS orderitems;
CREATE TABLE orderitems (
  `id` INT NOT NULL AUTO_INCREMENT primary key,
  `orderId` INT  NOT NULL,
  `itemId` INT  NOT NULL,
  `quantity` INT,
  `price` FLOAT(3,2),
  FOREIGN KEY (orderId)
	REFERENCES orders(id)
	ON DELETE CASCADE,
  FOREIGN KEY (itemId)
	REFERENCES menu(id)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO customers (firstName, lastName, sex, address, phone, email, birthday, media)
VALUES ('Harold', 'Chirinos', 'male', 'SJM', '999998998', 'harold@hotmail.com', '1991-03-01', ''),
('Cris', 'Cordova', 'male','SJL', '990990990', 'cris@hotmail.com', '1993-04-05', ''),
('Jimena', 'Aquino', 'female', 'Villa Maria', '954545434', 'jimena@hotmail.com', '1994-05-05', ''),
('Juan', 'Clinton', 'male', 'Miraflores', '989797804', 'juan@hotmail.com', '1994-09-09', ''),
('Marco', 'Bush', 'male', 'San Borja', '94505737', 'gabriela@hotmail.com', '1990-06-20', '')

INSERT INTO deliverers (firstName, lastName, sex, phone, email, birthday, media)
VALUES ('Danilo', 'Cordova', 'male', '999998998', 'danilo@gmail.com', '1991-03-01', ''),
('Jordan', 'Venecia', 'male', '990990990', 'jordan@hotmail.com', '1998-04-08',''),
('Gianella', 'Hurtado', 'female', '997997997', 'gianella@hotmail.com', '2002-05-15',''),
('Ericka', 'Zapata', 'female', '989797804', 'ericka@gmail.com', '1995-12-20',''),
('Cristofer', 'Zurich', 'male', '94505737', 'cristofer@outlook.com','2000-01-01','')

INSERT INTO menu (name, type, description, price, dow, media)
VALUES ('Ceviche', 'dish', 'Plate with fish, lemon, spices and condiments', '12.00', 'monday', ''),
('Rice with milk', 'desert', 'sweet of rice dipped in milK', '5.00', 'monday', ''),
('Rice with chicken', 'dish', 'green rice with delicious chicken', '12.00', 'tuesday', ''),
('Limeño sigh', 'desert', 'sweet cream of all flavors', '5.00', 'tuesday', ''),
('beef stew', 'dish', 'dish with beef, parboiled potatoes', '12.00', 'wednesday', ''),
('Chifa', 'dish', 'sauteed noodles with chicken and meat', '15.00', 'thrusday', ''),
('vegetable soup', 'dish', 'very healthy soup', '10.00', 'friday', ''),
('Chocolate cake', 'desert', 'delicius cake', '5.00', 'friday', '')


INSERT INTO orders (customerId, delivererId, dateTime, status, total, shippingAddress1, shippingAddress2, shippingCountry, shippingCity, shippingState,paymentMethod, postalCode)
VALUES ('5', '2', '', 'do not delivered', '2', 'San Borja', 'San Isidro', 'Peru', 'Lima', 'Lima', 'creditCard', '15056'),
('4', '1','', 'do not delivered', '2', 'San Borja', 'San Isidro', 'Peru', 'Lima', 'Lima', 'cash', '15056'),
('3', '2','', 'delivered', '1', 'Miraflores', 'Miraflores', 'Peru', 'Lima', 'Lima', 'cash', '15000'),
('2', '5','', 'delivered', '2', 'Miraflores', 'San Borja', 'Peru', 'Lima', 'Lima', 'cash', '150540'),
('1', '4','', 'delivered', '3', 'Surco', 'Jesus Maria', 'Peru', 'Lima', 'Lima', 'creditCard', '16050')

INSERT INTO orderitems (orderId, itemId, quantity, price)
VALUES ('6', '1', '1', '12.00'),
('7', '2', '1', '5'),
('8', '3', '4', '48.00'),
('9', '5', '1', '12.00'),
('10', '4', '2', '10.00')

