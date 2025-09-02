-- 1:
SELECT firstname, lastname
FROM customers
ORDER BY firstname ASC, lastname ASC
LIMIT 2 OFFSET (SELECT COUNT(*) - 2 FROM customers);

-- 2:

SELECT firstname, lastname
FROM customers
ORDER BY firstname DESC, lastname DESC
LIMIT 2;

-- 3:
SELECT *
FROM customers
WHERE firstname = 'Scott' AND lastname = 'Scott';

-- 4:
SELECT p.id AS purchase_id, 
       COALESCE(c.firstname, '') AS firstname, 
       COALESCE(c.lastname, '') AS lastname, 
       p.item_id, 
       p.quantity_purchased
FROM purchases p
LEFT JOIN customers c ON p.customer_id = c.id;

-- 5:
SELECT p.id AS purchase_id, 
       c.firstname, 
       c.lastname, 
       p.item_id, 
       p.quantity_purchased
FROM purchases p
INNER JOIN customers c ON p.customer_id = c.id;


