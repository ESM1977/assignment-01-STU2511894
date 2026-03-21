
-- DROP TABLES (optional)

DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_date;
DROP TABLE IF EXISTS dim_store;
DROP TABLE IF EXISTS dim_product;


-- DIMENSION TABLES

CREATE TABLE dim_date (
    date_id INTEGER PRIMARY KEY,
    full_date TEXT NOT NULL UNIQUE,
    day_of_month INTEGER NOT NULL,
    month_num INTEGER NOT NULL,
    month_name TEXT NOT NULL,
    quarter_num INTEGER NOT NULL,
    year_num INTEGER NOT NULL
);


CREATE TABLE dim_store (
    store_id INTEGER PRIMARY KEY AUTOINCREMENT,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE dim_product (
    product_id INTEGER PRIMARY KEY AUTOINCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

CREATE TABLE fact_sales (
    sales_id INTEGER PRIMARY KEY AUTOINCREMENT,
    date_id INT NOT NULL,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    total_revenue REAL NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- 2. INSERT dim_date (cleaned unique dates from CSV)

INSERT INTO dim_date VALUES
(20230115, '2023-01-15', 15, 1, 'January', 1, 2023),
(20230205, '2023-02-05', 5, 2, 'February', 1, 2023),
(20230220, '2023-02-20', 20, 2, 'February', 1, 2023),
(20230331, '2023-03-31', 31, 3, 'March', 1, 2023),
(20230809, '2023-08-09', 9, 8, 'August', 3, 2023),
(20230815, '2023-08-15', 15, 8, 'August', 3, 2023),
(20230829, '2023-08-29', 29, 8, 'August', 3, 2023),
(20231026, '2023-10-26', 26, 10, 'October', 4, 2023),
(20231208, '2023-12-08', 8, 12, 'December', 4, 2023),
(20231212, '2023-12-12', 12, 12, 'December', 4, 2023);


-- 3. INSERT dim_store (cleaned unique from CSV)

INSERT INTO dim_store (store_name, city, state) VALUES
('Chennai Anna', 'Chennai', 'Tamil Nadu'),
('Delhi South', 'Delhi', 'Delhi'),
('Bangalore MG', 'Bangalore', 'Karnataka'),
('Pune FC Road', 'Pune', 'Maharashtra'),
('Mumbai Central', 'Mumbai', 'Maharashtra');


-- 4. INSERT dim_product (cleaned unique from CSV, normalized categories)


INSERT INTO dim_product (product_name, category) VALUES
('Speaker', 'Electronics'),
('Tablet', 'Electronics'),
('Phone', 'Electronics'),
('Smartwatch', 'Electronics'),
('Atta 10kg', 'Grocery'),
('Jeans', 'Clothing'),
('Biscuits', 'Grocery'),
('Jacket', 'Clothing'),
('Laptop', 'Electronics'),
('Milk 1L', 'Grocery'),
('Saree', 'Clothing'),
('Headphones', 'Electronics'),
('Pulses 1kg', 'Grocery'),
('T-Shirt', 'Clothing'),
('Rice 5kg', 'Grocery');


-- 5. INSERT fact_sales (>=20 rows cleaned sample data from CSV)

-- Note: FKs based on INSERT order (date_id 1=2023-08-29 Chennai Anna Speaker, etc.)
-- Revenue = units_sold * unit_price

INSERT INTO fact_sales (date_id, store_id, product_id, quantity, total_revenue) VALUES
(1, 1, 1, 3, 147788.34),  -- TXN5000 Chennai Anna Speaker
(2, 1, 2, 11, 255486.32), -- TXN5001 Chennai Anna Tablet
(3, 1, 3, 20, 974066.80), -- TXN5002 Chennai Anna Phone
(4, 2, 2, 14, 325165.68), -- TXN5003 Delhi South Tablet
(5, 1, 4, 10, 588510.10), -- TXN5004 Chennai Anna Smartwatch
(6, 3, 5, 12, 629568.00), -- TXN5005 Bangalore MG Atta
(7, 4, 4, 6, 353106.06),  -- TXN5006 Pune Smartwatch
(8, 4, 7, 16, 37079.52),  -- TXN5007 Pune Jeans
(9, 3, 8, 9, 247229.91), -- TXN5008 Bangalore Biscuits (Grocery)
(10, 3, 4, 3, 176553.03),-- TXN5009 Bangalore Smartwatch
(11, 1, 7, 15, 452808.60),-- TXN5010 Chennai Jacket
(12, 5, 7, 13, 30126.11), -- TXN5011 Mumbai Jeans
(13, 3, 9, 13, 550059.95),-- TXN5012 Bangalore Laptop
(14, 5, 10, 10, 433743.90),-- TXN5013 Mumbai Milk (Grocery)
(15, 2, 7, 5, 150936.20), -- TXN5014 Delhi Jacket
(16, 5, 11, 15, 531777.15),-- TXN5015 Mumbai Saree
(17, 5, 11, 11, 389969.91),-- TXN5016 Mumbai Saree
(18, 3, 7, 6, 181223.44), -- TXN5017 Bangalore Jacket
(19, 3, 12, 15, 597824.40),-- TXN5018 Bangalore Headphones
(20, 1, 5, 3, 157392.00), -- TXN5019 Chennai Atta
(21, 2, 2, 14, 325165.68),-- TXN5066 Delhi Tablet (extra for coverage)
(22, 3, 9, 20, 846862.00); -- TXN5049 Pune Laptop (extra)

select * from dim_date;
select * from dim_store;
select * from dim_product;
select * from fact_sales;
