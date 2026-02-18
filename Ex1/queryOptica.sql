SELECT COUNT(*) AS total_2024 
FROM Sale 
WHERE Customer_customer_id = 1 
AND sale_date BETWEEN '2024-01-01' AND '2024-12-31';

SELECT DISTINCT G.brand 
FROM Sale S
JOIN Glasses G ON S.Glasses_glasses_id = G.glasses_id
WHERE S.Employee_idEmployee = 1 
AND YEAR(S.sale_date) = 2024;

SELECT DISTINCT Sup.name 
FROM Sale S
JOIN Glasses G ON S.Glasses_glasses_id = G.glasses_id
JOIN Supplier Sup ON G.Supplier_supplier_id = Sup.supplier_id;