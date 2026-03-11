USE OpticaDB;

INSERT INTO Address (street, number, city, postal_code, country) VALUES
('Calle Mayor', '1', 'Madrid', '28013', 'Spain'),
('Av. Diagonal', '400', 'Barcelona', '08037', 'Spain'),
('Polígono Industrial', '5', 'Valencia', '46000', 'Spain'),
('Carrer de Balmes', '15', 'Barcelona', '08007', 'Spain'),
('Carrer de Girona', '88', 'Barcelona', '08009', 'Spain'),
('Gran Via', '500', 'Barcelona', '08015', 'Spain');


INSERT INTO Supplier (name, fax, tax_id, phone, address_id) VALUES
('Luxottica Spain', '912345678', 'B12345678', '912345600', 1),
('Safilo Group', '934567890', 'B87654321', '934567800', 2),
('Optical World', '965432100', 'B55667788', '965432111', 3);


INSERT INTO Brand (name, Supplier_supplier_id) VALUES
('Ray-Ban', 1),
('Oakley', 1),
('Carrera', 2),
('Persol', 2);


INSERT INTO Employee (name) VALUES
('Marc García'),
('Laura Martínez'),
('Elena Rodríguez');


INSERT INTO Customer (name, phone, email, registration_date, address_id, Customer_customer_id) VALUES
('Joan Pons', '600111222', 'joan@email.com', '2024-01-10', 4, NULL),
('Anna Vives', '600333444', 'anna@email.com', '2024-02-15', 5, 1),
('Carme Soler', '600555666', 'carme@email.com', '2025-01-05', 6, NULL);


INSERT INTO Glasses (frame_type, frame_color, left_lens_color, right_lens_color, price, Brand_brand_id) VALUES
('Metallic', 'Black', 'Green', 'Green', 150.00, 1),
('Plastic', 'White', 'Blue', 'Blue', 180.00, 2),
('Metallic', 'Gold', 'Brown', 'Brown', 120.00, 3),
('Acetate', 'Tortoise', 'Grey', 'Grey', 210.00, 4);


INSERT INTO Sale (sale_date, total_amount, Customer_customer_id, Employee_idEmployee, Glasses_glasses_id) VALUES

('2024-05-15 11:00:00', 150.00, 1, 1, 1),
('2024-12-20 17:30:00', 120.00, 1, 1, 3),
('2025-02-10 10:00:00', 180.00, 1, 2, 2),
('2024-06-01 12:00:00', 210.00, 2, 1, 4),
('2025-01-20 18:00:00', 150.00, 3, 2, 1);