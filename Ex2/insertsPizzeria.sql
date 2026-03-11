USE pizzeria_db;

INSERT INTO province (name) VALUES ('Barcelona'), ('Tarragona');

INSERT INTO locality (name, id_province) VALUES 
('Sabadell', 1), 
('Terrassa', 1), 
('Reus', 2);

INSERT INTO store (address, zip_code, id_locality) VALUES 
('Calle Norte 123', '08201', 1), -- Tienda en Sabadell
('Av. Libertad 45', '43201', 3); -- Tienda en Reus

INSERT INTO employee (first_name, last_name, nif, phone, role, id_store) VALUES 
('Carlos', 'Sánchez', '12345678A', '611222333', 'delivery_driver', 1),
('Marta', 'López', '87654321B', '611444555', 'cook', 1);

INSERT INTO customer (first_name, last_name, address, zip_code, phone, id_locality) VALUES 
('Alberto', 'Ruiz', 'Calle Falsa 123', '08202', '600000001', 1), -- Cliente de Sabadell
('Elena', 'Gómez', 'Plaza Mayor 5', '08203', '600000002', 1);   -- Cliente de Sabadell

INSERT INTO product (name, description, price, product_type, id_category) VALUES 
('Coca-Cola', '33cl can', 2.50, 'drink', NULL),
('Water', '50cl bottle', 1.50, 'drink', NULL),
('Burger King', 'Classic beef burger', 8.50, 'hamburger', NULL),
('Pizza Margarita', 'Tomato, mozzarella, basil', 9.50, 'pizza', 1),
('Pizza Barbacoa', 'BBQ sauce, beef, onion', 11.00, 'pizza', 2),
('Pizza Vegetal', 'Vegetables and mozzarella', 10.50, 'pizza', 3);

INSERT INTO pizza_category (name) VALUES
('Clásicas'),
('Especiales'),
('Vegetarianas');

INSERT INTO `order` 
(delivery_type, total_price, id_customer, id_store, id_delivery_driver,delivery_datetime) 
VALUES 
('home_delivery', 12.50, 1, 1, 1, '2025-03-10 20:30:00');

INSERT INTO `order`
(delivery_type, total_price, id_customer, id_store, id_delivery_driver, delivery_datetime)
VALUES
('home_delivery', 5.00, 2, 1, 1, '2025-03-12 21:00:00');

INSERT INTO order_detail (id_order, id_product, quantity) VALUES 
(1, 1, 2), -- 2 Coca-colas en el pedido 1
(1, 3, 1), -- 1 hamburguesa
(2, 2, 3); -- 3 Aguas en el pedido 2