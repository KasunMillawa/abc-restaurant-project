-- Database Creation
CREATE DATABASE abc_restaurant_project;

-- Table Creation
USE abc_restaurant_project;

CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price VARCHAR(500) NOT NULL,
    description TEXT NOT NULL,
    image_path VARCHAR(500),  -- Increased length for storing image path
    category VARCHAR(100) NOT NULL  -- New column to store the category
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20),
    password VARCHAR(255)
);

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20),
    password VARCHAR(255),
    role ENUM('Staff', 'Manager')
);

CREATE TABLE Admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL
);
INSERT INTO Admin (username, password) 
VALUES ('adminUser', MD5('adminPass'));


CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    date DATE,
    time TIME,
    people INT,
    message TEXT,
    status VARCHAR(20)
);

CREATE TABLE Query (
  query_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  subject varchar(255) NOT NULL,
  message text NOT NULL,
  PRIMARY KEY (query_id)
);




CREATE TABLE Service (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE Offer (
    offer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    image VARCHAR(255) NOT NULL
);

CREATE TABLE Gallery (
    gallery_id INT AUTO_INCREMENT PRIMARY KEY,
    image VARCHAR(255) NOT NULL
);
