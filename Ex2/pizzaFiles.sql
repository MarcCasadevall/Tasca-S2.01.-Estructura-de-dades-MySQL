-- Create the database
CREATE DATABASE IF NOT EXISTS pizzeria_db;
USE pizzeria_db;

-- 1. Province Table
CREATE TABLE province (
    id_province INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL
);

-- 2. Locality Table (City)
CREATE TABLE locality (
    id_locality INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    id_province INT NOT NULL,
    CONSTRAINT fk_locality_province 
        FOREIGN KEY (id_province) REFERENCES province(id_province)
);

-- 3. Store Table
CREATE TABLE store (
    id_store INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(100) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    id_locality INT NOT NULL,
    CONSTRAINT fk_store_locality 
        FOREIGN KEY (id_locality) REFERENCES locality(id_locality)
);

-- 4. Employee Table
CREATE TABLE employee (
    id_employee INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    nif VARCHAR(20) UNIQUE NOT NULL,
    phone VARCHAR(20),
    role ENUM('cook', 'delivery_driver') NOT NULL,
    id_store INT NOT NULL,
    CONSTRAINT fk_employee_store 
        FOREIGN KEY (id_store) REFERENCES store(id_store)
);

-- 5. Customer Table
CREATE TABLE customer (
    id_customer INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    address VARCHAR(100) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    id_locality INT NOT NULL,
    CONSTRAINT fk_customer_locality 
        FOREIGN KEY (id_locality) REFERENCES locality(id_locality)
);

-- 6. Pizza Category Table
CREATE TABLE pizza_category (
    id_category INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL
);

-- 7. Product Table
CREATE TABLE product (
    id_product INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    description TEXT,
    image_url VARCHAR(255),
    price DECIMAL(10, 2) NOT NULL,
    product_type ENUM('pizza', 'hamburger', 'drink') NOT NULL,
    id_category INT DEFAULT NULL, -- Only populated if product_type is 'pizza'
    CONSTRAINT fk_product_category 
        FOREIGN KEY (id_category) REFERENCES pizza_category(id_category)
);

-- 8. Order Table
CREATE TABLE `order` (
    id_order INT AUTO_INCREMENT PRIMARY KEY,
    order_datetime DATETIME DEFAULT CURRENT_TIMESTAMP,
    delivery_type ENUM('home_delivery', 'pickup') NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    delivery_datetime DATETIME DEFAULT NULL, -- Only for home_delivery
    id_customer INT NOT NULL,
    id_store INT NOT NULL,
    id_delivery_driver INT DEFAULT NULL, -- References employee(id_employee)
    CONSTRAINT fk_order_customer 
        FOREIGN KEY (id_customer) REFERENCES customer(id_customer),
    CONSTRAINT fk_order_store 
        FOREIGN KEY (id_store) REFERENCES store(id_store),
    CONSTRAINT fk_order_delivery_driver 
        FOREIGN KEY (id_delivery_driver) REFERENCES employee(id_employee)
);

-- 9. Order Details Table (Many-to-Many between Order and Product)
CREATE TABLE order_detail (
    id_order_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_order INT NOT NULL,
    id_product INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    CONSTRAINT fk_detail_order 
        FOREIGN KEY (id_order) REFERENCES `order`(id_order),
    CONSTRAINT fk_detail_product 
        FOREIGN KEY (id_product) REFERENCES product(id_product)
);