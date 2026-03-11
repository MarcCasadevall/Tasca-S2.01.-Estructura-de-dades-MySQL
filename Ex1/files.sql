DROP DATABASE OpticaDB;
CREATE DATAbASE OpticaDB;
USE OpticaDB;


CREATE TABLE IF NOT EXISTS Address (
  address_id INT NOT NULL AUTO_INCREMENT,
  street VARCHAR(100),
  number VARCHAR(10),
  city VARCHAR(45),
  postal_code VARCHAR(10),
  country VARCHAR(45),
  PRIMARY KEY (address_id)
);


CREATE TABLE IF NOT EXISTS Supplier (
  supplier_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  fax VARCHAR(20),
  tax_id VARCHAR(20),
  phone VARCHAR(20),
  address_id INT,
  PRIMARY KEY (supplier_id),
  FOREIGN KEY (address_id)
    REFERENCES Address(address_id)
);


CREATE TABLE IF NOT EXISTS Brand (
  brand_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  Supplier_supplier_id INT NOT NULL,
  PRIMARY KEY (brand_id),
  FOREIGN KEY (Supplier_supplier_id)
    REFERENCES Supplier(supplier_id)
);


CREATE TABLE IF NOT EXISTS Employee (
  idEmployee INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45),
  PRIMARY KEY (idEmployee)
);


CREATE TABLE IF NOT EXISTS Customer (
  customer_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  phone VARCHAR(20),
  email VARCHAR(45),
  registration_date DATETIME,
  address_id INT,
  Customer_customer_id INT,
  PRIMARY KEY (customer_id),

  FOREIGN KEY (address_id)
    REFERENCES Address(address_id),

  CONSTRAINT fk_customer_recommendation
    FOREIGN KEY (Customer_customer_id)
    REFERENCES Customer (customer_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS Glasses (
  glasses_id INT NOT NULL AUTO_INCREMENT,
  frame_type VARCHAR(45),
  frame_color VARCHAR(45),
  left_lens_color VARCHAR(45),
  right_lens_color VARCHAR(45),
  price DECIMAL(10,2),
  Brand_brand_id INT NOT NULL,

  PRIMARY KEY (glasses_id),

  FOREIGN KEY (Brand_brand_id)
    REFERENCES Brand(brand_id)
);


CREATE TABLE IF NOT EXISTS Sale (
  idSale INT NOT NULL AUTO_INCREMENT,
  sale_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  total_amount DECIMAL(10,2),

  Customer_customer_id INT NOT NULL,
  Employee_idEmployee INT NOT NULL,
  Glasses_glasses_id INT NOT NULL,

  PRIMARY KEY (idSale),

  FOREIGN KEY (Customer_customer_id)
    REFERENCES Customer (customer_id),

  FOREIGN KEY (Employee_idEmployee)
    REFERENCES Employee (idEmployee),

  FOREIGN KEY (Glasses_glasses_id)
    REFERENCES Glasses (glasses_id)
);

