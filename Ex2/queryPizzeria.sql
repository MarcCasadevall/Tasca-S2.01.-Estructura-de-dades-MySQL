SELECT SUM(od.quantity) AS total_drinks_sold
FROM order_detail od
JOIN product p ON od.id_product = p.id_product
JOIN `order` o ON od.id_order = o.id_order
JOIN customer c ON o.id_customer = c.id_customer
JOIN locality l ON c.id_locality = l.id_locality
WHERE p.product_type = 'drink' 
AND l.name = 'Sabadell';


SELECT e.first_name, e.last_name, COUNT(o.id_order) AS total_orders_handled
FROM `order` o
JOIN employee e ON o.id_delivery_driver = e.id_employee
WHERE e.id_employee = 1;