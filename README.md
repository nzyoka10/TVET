# TVET College Ecommerce Database

This repository contains the PostgreSQL database schema and sample data for a TVET college's ecommerce platform.

## Database Schema

The database schema includes the following tables:
- `Locations`: Stores information about the college's different locations.
- `Products`: Contains details about the products available in the ecommerce platform.
- `Users`: Stores user information such as username, password, and user type.
- `Orders`: Tracks orders made by users.
- `Order_Details`: Contains details of products included in each order.
- `Categories`: Stores product categories.
- `Transactions`: Tracks transactions related to orders.
- `Inventory`: Keeps track of product inventor

## Usage

1. **Clone the Repository:**  ``git clone <URL>``
2. **Create the Database:**
3. **Insert Sample Data:**


## Sample Data

```SQL
-- Table: Categories
CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Sample Data for Categories
INSERT INTO Categories (category_name) VALUES 
    ('Food'),
    ('Beverages'),
    ('Books'),
    ('Stationery'),
    ('Electronics');
```



