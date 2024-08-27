
-- Add a new product
INSERT INTO Products (name, description, category, price, stock_qty)
VALUES ('Laptop', '15-inch screen 8gb RAM', 'Electronics', 799.99, 20)
;

-- Add a new supplier
INSERT INTO Suppliers (name, contact_info)
VALUES ('Tech Supplies Co.', 'techsupplies@example.com')
;

-- Add info to inventory
INSERT INTO Inventory (product_id, supplier_id, stock_qty, reorder_level)
VALUES (1, 1, 20, 5)
;

-- Record new order
INSERT INTO Orders (product_id, supplier_id, qty_ordered, order_date, arrival_date)
VALUES(1, 1, 50, '2024-08-27', '2024-09-01')
;

-- Sample Queries

-- Retrieve all products and details
SELECT * FROM Products;

-- Fetch product names, stock level and reorder level
SELECT p.name, i.stock_qty, i.reorder_level
FROM Products p
JOIN Inventory i
    ON p.id = i.product_id
;

-- Check for products that needs to be reordered based on stock levels
SELECT p.name, i.stock_qty, i.reorder_level
FROM Products p
JOIN Inventory i
    ON p.id = i.product_id
WHERE i.stock_qty <= i.reorder_level
;

-- Update product stock qty after new order arrives
UPDATE Inventory
SET stock_qty = stock_qty + 30 -- sample increase by 30 units, adjust as needed
WHERE product_id = 1 -- specify the product_id to update
;

-- Delete obsolete product
DELETE FROM Products
WHERE id = 2 -- specify the product_id to delete
;
