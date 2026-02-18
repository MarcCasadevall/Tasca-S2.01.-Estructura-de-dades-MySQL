USE OpticaDB;

INSERT INTO Supplier (name, adress, fax, tax_id, phone) VALUES 
('Luxottica Spain', 'Calle Mayor 1, Madrid', 912345678, 12345678, '912345600'),
('Safilo Group', 'Av. Diagonal 400, Barcelona', 934567890, 87654321, '934567800'),
('Optical World', 'Polígono Industrial 5, Valencia', 965432100, 55667788, '965432111');

INSERT INTO Employee (name) VALUES 
('Marc García'), 
('Laura Martínez'),
('Elena Rodríguez');

INSERT INTO Customer (name, address, phone, email, registration_date, Customer_customer_id) VALUES 
('Joan Pons', 'Carrer de Balmes 15, BCN', '600111222', 'joan@email.com', '2024-01-10', NULL),
('Anna Vives', 'Carrer de Girona 88, BCN', '600333444', 'anna@email.com', '2024-02-15', 1), -- Recomendada por Joan
('Carme Soler', 'Gran Via 500, BCN', '600555666', 'carme@email.com', '2025-01-05', NULL);

INSERT INTO Glasses (brand, lens, frame_type, frame_color, lens_color, price, Supplier_supplier_id) VALUES 
('Ray-Ban', 'Polarized', 'Metallic', 'Black', 'Green', 150, 1),
('Oakley', 'Sport', 'Plastic', 'White', 'Blue', 180, 1),
('Carrera', 'Standard', 'Metallic', 'Gold', 'Brown', 120, 2),
('Persol', 'Vintage', 'Acetate', 'Tortoise', 'Grey', 210, 2);

INSERT INTO Sale (sale_date, total_amount, Customer_customer_id, Employee_idEmployee, Glasses_glasses_id) VALUES 
-- Ventas para Joan Pons (ID 1) en 2024 y 2025
('2024-05-15 11:00:00', 150.00, 1, 1, 1), 
('2024-12-20 17:30:00', 120.00, 1, 1, 3),
('2025-02-10 10:00:00', 180.00, 1, 2, 2), 
('2024-06-01 12:00:00', 210.00, 2, 1, 4),
('2025-01-20 18:00:00', 150.00, 3, 2, 1);