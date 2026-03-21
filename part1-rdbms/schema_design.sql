-- 1. Customers table
CREATE TABLE Customers (
    customer_id TEXT PRIMARY KEY,
    customer_name TEXT NOT NULL,
    customer_email TEXT NOT NULL,
    customer_city TEXT NOT NULL
);

-- 2. Products table
CREATE TABLE Products (
    product_id TEXT PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL,
    unit_price REAL NOT NULL
);

-- 3. Offices table
CREATE TABLE Offices (
    office_id TEXT PRIMARY KEY,
    office_address TEXT NOT NULL
);

-- 4. Sales Representatives table
CREATE TABLE Sales_Reps (
    sales_rep_id TEXT PRIMARY KEY,
    sales_rep_name TEXT NOT NULL,
    sales_rep_email TEXT NOT NULL,
    office_id TEXT NOT NULL,
    FOREIGN KEY (office_id) REFERENCES Offices(office_id)
);

-- 5. Orders table
CREATE TABLE Orders (
    order_id TEXT PRIMARY KEY,
    customer_id TEXT NOT NULL,
    product_id TEXT NOT NULL,
    sales_rep_id TEXT NOT NULL,
    quantity INTEGER NOT NULL,
    order_date TEXT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (sales_rep_id) REFERENCES Sales_Reps(sales_rep_id)
);


-- 1. INSERT STATEMENT FOR Offices
INSERT INTO Offices VALUES
('O001', 'Mumbai HQ, Nariman Point, Mumbai - 400021');
INSERT INTO Offices VALUES
('O002', 'Delhi Office, Connaught Place, New Delhi - 110001');
INSERT INTO Offices VALUES
('O003', 'Bangalore Office, MG Road, Bangalore - 560001');
INSERT INTO Offices VALUES
('O004', 'Pune Office, Shivajinagar, Pune - 411005');
INSERT INTO Offices VALUES
('O005', 'Chennai Office, T Nagar, Chennai - 600017');

-- 2. INSERT STATEMENT FOR Customers
INSERT INTO Customers VALUES
('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai');
INSERT INTO Customers VALUES
('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi');
INSERT INTO Customers VALUES
('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore');
INSERT INTO Customers VALUES
('C004', 'Sneha Iyer', 'sneha@gmail.com', 'Pune');
INSERT INTO Customers VALUES
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai');

-- 3. INSERT STATEMENT FOR Products
INSERT INTO Products VALUES
('P001', 'Laptop', 'Electronics', 55000);
INSERT INTO Products VALUES
('P002', 'Mouse', 'Accessories', 800);
INSERT INTO Products VALUES
('P003', 'DeskChair', 'Furniture', 8500);
INSERT INTO Products VALUES
('P004', 'Notebook', 'Stationery', 120);
INSERT INTO Products VALUES
('P005', 'HeadPhones', 'Electronics', 3200);

-- 4. INSERT STATEMENT FOR Sales_Reps
INSERT INTO Sales_Reps VALUES
('SR01', 'Deepak Joshi', 'deepak@corp.com', 'O001');
INSERT INTO Sales_Reps VALUES
('SR02', 'Anita Desai', 'anita@corp.com', 'O002');
INSERT INTO Sales_Reps VALUES
('SR03', 'Ravi Kumar', 'ravi@corp.com', 'O003');


-- 5. INSERT STATEMENT FOR Orders
INSERT INTO Orders VALUES
('ORD1001', 'C004', 'P002', 'SR03', 5, '2023-02-22');
INSERT INTO Orders VALUES
('ORD1027', 'C002', 'P004', 'SR02', 4, '2023-11-23');
INSERT INTO Orders VALUES
('ORD1114', 'C001', 'P007', 'SR01', 1, '2024-01-12');
INSERT INTO Orders VALUES
('ORD1153', 'C006', 'P007', 'SR01', 3, '2023-02-14');
INSERT INTO Orders VALUES
('ORD1002', 'C002', 'P005', 'SR02', 1, '2023-01-17');

select * from Offices
select * from Customers 
select * from Products
select * from Sales_Reps
select * from Orders
