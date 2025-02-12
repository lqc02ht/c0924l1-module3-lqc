CREATE DATABASE `student_management`;

USE `student_management`;

CREATE TABLE class (
    id INT,
    name VARCHAR(50)
);

CREATE TABLE teacher (
    id INT,
    name VARCHAR(50),
    age INT,
    country VARCHAR(20)
);