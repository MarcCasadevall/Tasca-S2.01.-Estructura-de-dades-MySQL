CREATE DATABASE IF NOT EXISTS OpticaDB;
USE OpticaDB;

CREATE TABLE IF NOT EXISTS Supplier (
  supplier_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  adress VARCHAR(45),
  fax INT,
  tax_id INT,
  phone VARCHAR(45),
  PRIMARY KEY (supplier_id)
);


CREATE TABLE IF NOT EXISTS Employee (
  idEmployee INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45),
  PRIMARY KEY (idEmployee)
);


CREATE TABLE IF NOT EXISTS Customer (
  customer_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  address VARCHAR(45),
  phone VARCHAR(45),
  email VARCHAR(45),
  registration_date DATETIME,
  Customer_customer_id INT, 
  PRIMARY KEY (customer_id),
  CONSTRAINT fk_customer_recommendation
    FOREIGN KEY (Customer_customer_id)
    REFERENCES Customer (customer_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS Glasses (
  glasses_id INT NOT NULL AUTO_INCREMENT,
  brand VARCHAR(45),
  lens VARCHAR(45),
  frame_type VARCHAR(45),
  frame_color VARCHAR(45),
  lens_color VARCHAR(45),
  price INT,
  Supplier_supplier_id INT NOT NULL,
  PRIMARY KEY (glasses_id),
  CONSTRAINT fk_glasses_supplier
    FOREIGN KEY (Supplier_supplier_id)
    REFERENCES Supplier (supplier_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE IF NOT EXISTS Sale (
  idSale INT NOT NULL AUTO_INCREMENT,
  sale_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  total_amount DECIMAL(10,2),
  Customer_customer_id INT NOT NULL,
  Employee_idEmployee INT NOT NULL,
  Glasses_glasses_id INT NOT NULL,  
  
  PRIMARY KEY (idSale),
  CONSTRAINT fk_sale_customer
    FOREIGN KEY (Customer_customer_id)
    REFERENCES Customer (customer_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_sale_employee
    FOREIGN KEY (Employee_idEmployee)
    REFERENCES Employee (idEmployee)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_sale_glasses
    FOREIGN KEY (Glasses_glasses_id)
    REFERENCES Glasses (glasses_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);