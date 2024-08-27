# Design Document

By Haron P. Mohamad Jr. / pidstudev / [https://github.com/pidstudev](https://github.com/pidstudev)

Video overview: <[https://youtu.be/ITlkExNOFLg](https://youtu.be/ITlkExNOFLg)>

## Scope

### Purpose
The purpose of this database is to manage inventory for a business. It tracks product details, supplier information, current inventory levels, and order records. This system aims to enhance business operations by ensuring optimal inventory levels, preventing stockouts and overstock situations, and facilitating efficient order management.

### In-Scope
- **Products**: Information about the items being sold, including their names, descriptions, categories, prices, and stock quantities.
- **Suppliers**: Details about the suppliers providing the products, including their names and contact information.
- **Inventory**: Details about the current stock levels of products, including stock quantities and reorder levels.
- **Orders**: Records of product orders, including the quantities ordered, order dates, and expected arrival dates.

### Out-of-Scope
- **Customer Information**: Customer details are not included in this database.
- **Sales Transactions**: The database does not track individual sales transactions or customer interactions.
- **Detailed Product Reviews**: Detailed product reviews or ratings are outside the scope.

## Functional Requirements

### User Capabilities
- **Add New Products**: Users should be able to insert new products into the database.
- **Add New Suppliers**: Users should be able to add new supplier information.
- **Manage Inventory**: Users should be able to update inventory levels and set reorder thresholds.
- **Record Orders**: Users should be able to record new orders and track their details.
- **Retrieve Data**: Users should be able to retrieve information about products, inventory levels, reorder needs, and order history.
- **Update Stock**: Users should be able to update stock quantities when new orders arrive.
- **Delete Products**: Users should be able to remove obsolete products from the database.

### Beyond Scope
- **Advanced Reporting**: The system does not include advanced reporting or analytics features.
- **Multi-Location Support**: The design does not account for inventory management across multiple locations or warehouses.
- **User Authentication**: There is no user authentication or role-based access control in this database design.

## Representation

### Entities

- **Products**:
  - **Attributes**:
    - `id` (INT, Primary Key, Auto Increment)
    - `name` (VARCHAR)
    - `description` (TEXT)
    - `category` (VARCHAR)
    - `price` (DECIMAL)
    - `stock_qty` (INT)
  - **Justification**: The chosen attributes provide essential information about each product. `VARCHAR` is used for textual data, `DECIMAL` for price, and `INT` for quantities. Constraints ensure that all necessary fields are filled.

- **Suppliers**:
  - **Attributes**:
    - `id` (INT, Primary Key, Auto Increment)
    - `name` (VARCHAR)
    - `contact_info` (VARCHAR)
  - **Justification**: Stores supplier information. `VARCHAR` is used for textual data, and `INT` for the primary key. Ensuring contact info is not null ensures that all suppliers have valid contact details.

- **Inventory**:
  - **Attributes**:
    - `inventory_id` (INT, Primary Key, Auto Increment)
    - `product_id` (INT, Foreign Key)
    - `supplier_id` (INT, Foreign Key)
    - `stock_qty` (INT)
    - `reorder_level` (INT)
  - **Justification**: Links products and suppliers with inventory details. Foreign keys ensure referential integrity. `INT` is used for quantities, and constraints ensure valid stock levels and reorder points.

- **Orders**:
  - **Attributes**:
    - `id` (INT, Primary Key, Auto Increment)
    - `product_id` (INT, Foreign Key)
    - `supplier_id` (INT, Foreign Key)
    - `qty_ordered` (INT)
    - `order_date` (DATE)
    - `arrival_date` (DATE)
  - **Justification**: Tracks orders with necessary details. `DATE` is used for dates, and `INT` for quantities. Foreign keys maintain relationships with products and suppliers.

### Relationships
- **Products to Inventory**: One-to-Many. A product can be linked to multiple inventory records.
- **Suppliers to Inventory**: One-to-Many. A supplier can supply multiple products.
- **Products to Orders**: One-to-Many. A product can be part of multiple orders.
- **Suppliers to Orders**: One-to-Many. A supplier can be associated with multiple orders.

![inventory-management-erd](https://mermaid.ink/img/pako:eNq1lNtu4jAQhl_F8nX7AtxFHLRRS0sBVXsRCXntKbWa2OnEQULAu-9MTA4tVN3Van3lsT9P5v898UFqb0COJODEqi2qInOCxgK9qXWoxCHGPNKHtbBGLO5EJhdoC4V7cQf7TPbIc7Ic_0iWwqkCGqrJIh4oHGLr6c-1MFBptGWw3g3QSb96LbFWAbaePtyfGJ-XhvhkOk7nyb0o0ephIQuOhyBrqoLXb5v3wElXPBdPtXLBhi7lKXNxsqrLMreA_-hLm-bCmE6md0HpsLHuxQ_5cVwXKa1fFJe6HbjA5nwurt3YfFMmw2W0itEZozOPYLfuGlqdy_oj9luTWxLBo6GkOewgJ3oZY3HP8YXoR9772-v4jzpJ4aapFwyBrcZYJpgPPZqspyJKNdTCRDeQmFBwwSlEu1N5SyYx_MB2lnT_7vF4e-sPfV-M6GTTQdZV7am-o6_R592O_pw6us9k6nReGxJt3Zepe3quDIhfjXnMyhtZABbKGnqJmqvMZHgF_jeYNgrfGD0Rp-rgV3un5ShgDTcSfb19laMXlVcU1SUbdH7JWgSMJT3z-M41z93pNwZ8jfo)

## Optimizations

### Indexes
- **Indexes on Inventory Table**: `idx_product_id` and `idx_supplier_id` are created to improve the performance of queries involving product and supplier lookups.

### Views
- **Reorder Reports View**: Consider creating a view to easily fetch products that need reordering based on stock levels and reorder thresholds.

## Limitations

- **Scalability**: The design does not address scaling for very large datasets or high transaction volumes.
- **Complex Relationships**: The current design may not handle complex supply chains or multi-location inventory management.
- **Data Validation**: Limited data validation is included, which might need enhancement to prevent incorrect data entries.
