CREATE DATABASE `student-management`;

USE `student-management`;

CREATE TABLE Class (
    id INT,
    name VARCHAR(100)
);

CREATE TABLE Teacher (
    id INT,
    name VARCHAR(100),
    age INT,
    country VARCHAR(100)
);