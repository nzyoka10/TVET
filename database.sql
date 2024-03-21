-- Author: [Eric Nzyoka]

-- Description: This script creates a PostgreSQL database schema for a local TVET college's ecommerce platform, including tables for locations, products, users, orders, order details, categories, transactions, and inventory.

-- Create the database
CREATE DATABASE tvet_college_ecommerce;

-- Connect to the newly created database
\c tvet_college_ecommerce;

-- Table: Locations
CREATE TABLE Locations (
    location_id SERIAL PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL,
    location_type VARCHAR(50) NOT NULL
);

-- Table: Products
CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    location_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

-- Table: Users
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    user_type VARCHAR(20) NOT NULL
);

-- Table: Orders
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    order_date DATE NOT NULL DEFAULT CURRENT_DATE,
    total_amount NUMERIC(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Table: Order_Details
CREATE TABLE Order_Details (
    order_detail_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Table: Categories
CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Table: Transactions
CREATE TABLE Transactions (
    transaction_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    transaction_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50) NOT NULL,
    amount_paid NUMERIC(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Table: Inventory
CREATE TABLE Inventory (
    inventory_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Sample Records (insert into each table)
-- Locations
INSERT INTO Locations (location_name, location_type) VALUES 
    ('College Cafeteria 1', 'Cafeteria'),
    ('College Cafeteria 2', 'Cafeteria'),
    ('College Cafeteria 3', 'Cafeteria'),
    ('College Cafeteria 4', 'Cafeteria'),
    ('College Cafeteria 5', 'Cafeteria'),
    ('Tuck Shop 1', 'Tuck Shop'),
    ('Tuck Shop 2', 'Tuck Shop'),
    ('Tuck Shop 3', 'Tuck Shop'),
    ('Tuck Shop 4', 'Tuck Shop'),
    ('Tuck Shop 5', 'Tuck Shop'),
    ('Pharmacy 1', 'Pharmacy'),
    ('Pharmacy 2', 'Pharmacy'),
    ('Pharmacy 3', 'Pharmacy'),
    ('Bookshop 1', 'Bookshop'),
    ('Bookshop 2', 'Bookshop'),
    ('Digital Center 1', 'Digital Center'),
    ('Digital Center 2', 'Digital Center'),
    ('Digital Center 3', 'Digital Center');

-- Categories
INSERT INTO Categories (category_name) VALUES 
    ('Food'),
    ('Beverages'),
    ('Books'),
    ('Stationery'),
    ('Electronics');

-- Users
INSERT INTO Users (username, password, user_type) VALUES 
    ('student1', 'password123', 'student'),
    ('staff1', 'password456', 'staff'),
    ('guest1', 'guestpass', 'guest');

-- Sample records for other tables can be added similarly.
