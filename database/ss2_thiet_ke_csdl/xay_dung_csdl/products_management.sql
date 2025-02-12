CREATE DATABASE products_management;

USE products_management;

CREATE TABLE customer (
    id INT PRIMARY KEY,
    `name` VARCHAR(100),
    age INT
);

CREATE TABLE `order` (
    id INT PRIMARY KEY,
    `date` DATETIME,
    price DOUBLE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE product (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    price DOUBLE
);

CREATE TABLE order_detail (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES `order`(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

