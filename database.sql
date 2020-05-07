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
`birthday` DATETIME DEFAULT CURRENT_TIMESTAMP,
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
`birthday` DATETIME DEFAULT CURRENT_TIMESTAMP,
`media` VARCHAR(100) null
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS menu;
CREATE TABLE menu (
  `id` INT NOT NULL AUTO_INCREMENT primary key,
  `name` VARCHAR(45) NOT NULL,
  `type` enum ('dish', 'dessert') NOT NULL,
  `description` VARCHAR(100) NULL,
  `price` FLOAT(4,2) NOT NULL,
  `dow` enum ('monday', 'tuesday', 'wednesday', 'thrusday', 'friday', 'saturday', 'sunday'),
  `media` VARCHAR(200) null
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  `id` INT NOT NULL AUTO_INCREMENT primary key,
  `customerId` INT  NOT NULL,
  `delivererId` INT  NOT NULL,
  `dateTime` DATETIME,
  `status` enum ('do not delivered', 'delivered') NOT NULL,
  `total` FLOAT(4,2),
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
  `price` FLOAT(4,2),
  FOREIGN KEY (orderId)
	REFERENCES orders(id)
	ON DELETE CASCADE,
  FOREIGN KEY (itemId)
	REFERENCES menu(id)
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO customers (firstName, lastName, sex, address, phone, email, birthday, media)
VALUES ('Harold', 'Carhuancho', 'male', 'SJM', '999998998', 'harold@hotmail.com', '1991-03-01', ''),
('Cris', 'Cordova', 'male', 'SJL', '990990990', 'cris@hotmail.com', '1993-04-05', ''),
('Jimena', 'Aquino', 'female', 'Villa Maria', '954545434', 'jimena@hotmail.com', '1994-05-05', ''),
('Juan', 'Clinton', 'male', 'Miraflores', '989797804', 'juan@hotmail.com', '1994-09-09', ''),
('Marco', 'Bush', 'male', 'San Borja', '94505737', 'gabriela@hotmail.com', '1990-06-20', ''),
('Kevin', 'Lopez', 'male', 'VMT', '943436479', 'kevin@hotmail.com', '2000-04-01', ''),
('Linda', 'Lohan', 'female', 'Pueblo Libre', '999334994', 'inda@hotmail.com', '1998-08-20', ''),
('Jonathan', 'Clinton', 'female', 'Miraflores', '943567998', 'Jonas@hotmail.com', '1991-09-10', ''),
('Martha', 'Vanders', 'male', 'Miraflores', '934567997', 'martha@hotmail.com', '1992-09-09', ''),
('Bartos', 'Ulrich', 'male', 'San Borja', '945055991', 'bartos@hotmail.com', '1990-06-20', '')

INSERT INTO deliverers (firstName, lastName, sex, phone, email, birthday, media)
VALUES ('Hector', 'Santa', 'male', '999998998', 'hector@gmail.com', '1991-03-01', ''),
('Martin', 'Kurkue', 'male', '990990990', 'martin@hotmail.com', '1993-04-05',''),
('Nitzie', 'Hurtado', 'female', '954545434', 'nitzie@outlook.com' ,'1994-05-05',''),
('Roberto', 'Castillo', 'male', '989797804', 'roberto@gmail.com', '1994-09-09',''),
('Roxana', 'Vasquez', 'female', '94505737', 'roxana@outlook.com', '1990-06-20',''),
('Jeremias', 'Vanhelsing', 'male', '990990990', 'jeremias@gmail.com', '1993-04-05',''),
('Marcia', 'Clinvt', 'female', '998993443', 'marcia@hotmail.com', '1994-05-05',''),
('Fabrizio', 'Escobedo', 'male', '989797804', 'fabrizio@hotmail.com','1994-09-09',''),
('Vanessa', 'Torrejon', 'female', '987887885', 'vanesa@hotmail.com', '1993-04-05',''),
('Anthony', 'De la Rosa', 'male', '94505737', 'anthony@hotmail.com', '1990-06-20','')

INSERT INTO menu (name, type, description, price, dow, media)
VALUES ('Ceviche', 'dish', 'Plate with fish, lemon, spices and condiments', '12.00', 'monday', ''),
('Rice with milk', 'dessert', 'sweet of rice dipped in mill', '5.00', 'monday', ''),
('Rice with chicken', 'dish', 'green rice with delicious chicken', '10.00', 'monday', ''),
('Limeño sigh', 'dessert', 'sweet cream of all flavors', '5.00', 'monday', ''),
('Chifa', 'dish', 'sauteed noodles with chicken and meat', '10.00', 'tuesday', ''),
('Ice chocolate', 'dessert', 'sweet of chocolate', '5.00', 'tuesday', ''),
('Red noodles', 'dish', 'noodles in sauce of tomato', '12.00', 'tuesday', ''),
('Apple pie', 'dessert', 'delicius desert of apples', '5.00', 'tuesday', ''),
('Green noodles', 'dish', 'noodles in vegetable sauce with meat fillet', '10.00', 'wednesday', ''),
('strawberry tartlet', 'desssert', 'delicius desert of strawberry', '5.00', 'wednesday', ''),
('Carapulcra', 'dish', 'traditional dish of Chincha, dried potatoes accompanied with pork', '12.00', 'wednesday', ''),
('Cream flipped', 'dessert', 'sweet with milk', '5.00', 'wednesday', ''),
('Rice with quinua', 'dish', 'healtly dish', '10.00', 'thrusday', ''),
('Lemon pie', 'dessert', 'delicius desert of lemon', '5.00', 'thrusday', ''),
('Aji de Gallina', 'dish', 'shredded chicken with potatoes and yellow sauce', '12.00', 'thrusday', ''),
('Snickers rolls', 'dessert', 'chocolate-coated pitipans', '5.00', 'thrusday', ''),
('Coquille St. Jacques', 'dish', 'sautéed in butter, topped with Gruyère and breadcrumbs, and then broiled', '10.00', 'Friday', ''),
('Low-fat mango fool', 'dessert', 'sweet of mango', '5.00', 'Friday', ''),
('Petite Marmite', 'dish', ' It’s basically a clear beef and vegetable soup, made in an earthenware pot and usually served with shredded cabbage and marrow bones.', '12.00', 'Friday', ''),
('Apple cinnamon custard cake', 'dessert', 'cake sweet of apple', '5.00', 'Friday', ''),
('Minute steak', 'dish', 'a steak sliced or pounded so thinly that they cook up in a minute', '10.00', 'Saturday', ''),
('Honey cheesecake', 'dessert', 'sweet cheesecake', '5.00', 'Saturday', ''),
('Chicken a la King', 'dish', 'It’s a relatively simple dish of chicken, mushrooms and vegetables in a sherry-kicked cream sauce, served over pasta or toast', '12.00', 'Saturday', ''),
('Maltesers tiramisu','dessert', 'For a twist the classic Italian dessert,our Maltesers tiramisu', '5.00', 'Saturday', '')

INSERT INTO orders (customerId, delivererId, dateTime, status, total, shippingAddress1, shippingAddress2, shippingCountry, shippingCity, shippingState, paymentMethod, postalCode)
VALUES ('5', '2', '', 'do not delivered', '2', 'San Borja', 'San Isidro', 'Peru', 'Lima', 'Lima', 'creditCard', '15056'),
('4', '1','', 'do not delivered', '2', 'San Borja', 'San Isidro', 'Peru', 'Lima', 'Lima', 'cash', '15056'),
('3', '2','', 'delivered', '1', 'Miraflores', 'Miraflores', 'Peru', 'Lima', 'Lima', 'cash', '15000'),
('2', '5','', 'delivered', '2', 'Miraflores', 'San Borja', 'Peru', 'Lima', 'Lima', 'cash', '150540'),
('1', '4','', 'delivered', '3', 'Surco', 'Jesus Maria', 'Peru', 'Lima', 'Lima', 'creditCard', '16050')
('2', '2', '', 'do not delivered', '2', 'San Borja', 'San Isidro', 'Peru', 'Lima', 'Lima', 'creditCard', '15056'),
('2', '1','', 'do not delivered', '2', 'San Borja', 'San Isidro', 'Peru', 'Lima', 'Lima', 'cash', '15056'),
('3', '2','', 'delivered', '1', 'Miraflores', 'Miraflores', 'Peru', 'Lima', 'Lima', 'cash', '15000'),
('3', '5','', '', '2', 'Miraflores', 'San Borja', 'Peru', 'Lima', 'Lima', 'cash', '150540'),
('5', '4','', '', '3', 'Surco', 'Jesus Maria', 'Peru', 'Lima', 'Lima', 'creditCard', '16050')

INSERT INTO orderitems (orderId, itemId, quantity, price)
VALUES ('1', '1', '1', '12.00'),
('2', '2', '1', '5'),
('3', '3', '4', '48.00'),
('4', '5', '1', '12.00'),
('5', '6', '2', '10.00'),
('6', '7', '1', '12.00'),
('7', '2', '1', '5'),
('8', '3', '4', '48.00'),
('9', '5', '1', '12.00'),
('10', '4', '2', '10.00')

/* query for do consult the order history for each client */

SELECT orders.id as numberOrder, customers.firstName, customers.lastName
FROM orders
INNER JOIN customers
ON customers.id=orders.customerId
WHERE customers.id=(customer you want to consult);
