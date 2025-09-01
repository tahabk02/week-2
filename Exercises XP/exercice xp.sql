-- 1. All the items
SELECT * FROM items;

-- 2. All the items with a price above 80 
SELECT * FROM items WHERE price > 80;

-- 3. All the items with a price below 300 
SELECT * FROM items WHERE price <= 300;

-- 4. All customers whose last name is 'Smith'
SELECT * FROM customers WHERE lastname = 'Smith';


-- 5. All customers whose last name is 'Jones'
SELECT * FROM customers WHERE lastname = 'Jones';

-- 6. All customers whose firstname is not 'Scott'
SELECT * FROM customers WHERE firstname <> 'Scott';
