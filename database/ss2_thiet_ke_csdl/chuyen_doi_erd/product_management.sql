CREATE DATABASE product_management;

USE product_management;

CREATE TABLE provider (
	id INT PRIMARY KEY,
	`name` VARCHAR(100),
    addresss VARCHAR(50),
    phone VARCHAR(10)
);

CREATE TABLE phone (
	id INT PRIMARY KEY,
    provider_id INT,
    FOREIGN KEY (provider_id) REFERENCES provider(id)
);

CREATE TABLE orders (
	id INT PRIMARY KEY,
	`date` DATETIME,
    orders_id INT,
    FOREIGN KEY (orders_id) REFERENCES provider(id)
);

CREATE TABLE products (
	id INT PRIMARY KEY,
	name VARCHAR(100)
);

CREATE TABLE orders_detail (
	order_id INT,
    product_id INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE delivery (
	id INT PRIMARY KEY,
	`date` DATETIME
);

CREATE TABLE received (
	id INT PRIMARY KEY,
	`date` DATETIME
);

CREATE TABLE delivery_detail (
	delivery_id INT,
    product_id INT,
	price DOUBLE,
    `number` INT,
    PRIMARY KEY (delivery_id, product_id),
    FOREIGN KEY (delivery_id) REFERENCES delivery(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE received_detail (
	received_id INT,
    product_id INT,
	price DOUBLE,
    `number` INT,
    PRIMARY KEY (received_id, product_id),
    FOREIGN KEY (received_id) REFERENCES received(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


