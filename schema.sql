-- Create table for Product Information
CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(25) NOT NULL,
    price DECIMAL(12, 2) NOT NULL,
    stock_qty INT NOT NULL
);

-- Create table for Supplier Information
CREATE TABLE Suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(100) NOT NULL
);

-- Create table for Current Invetory Details
CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    supplier_id INT NOT NULL,
    stock_qty INT NOT NULL,
    reorder_level INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE CASCADE,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(id) ON DELETE CASCADE
);

CREATE TABLE Orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    supplier_id INT NOT NULL,
    qty_ordered INT NOT NULL,
    order_date DATE,
    arrival_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE CASCADE,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(id) ON DELETE CASCADE
);

-- Create indexes to improve query performance
CREATE INDEX idx_product_id ON Inventory(product_id);
CREATE INDEX idx_supplier_id ON Inventory(supplier_id);
