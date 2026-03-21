-- Customers Table
CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY
);

-- Stores Table
CREATE TABLE Stores (
    store_id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(50) NOT NULL,
    store_city VARCHAR(50)
);

-- Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

-- Sales Representatives Table
CREATE TABLE Sales_Reps (
    rep_id INT PRIMARY KEY AUTO_INCREMENT,
    rep_name VARCHAR(50)
);

-- Orders Table
CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id VARCHAR(10),
    store_id INT,
    rep_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (store_id) REFERENCES Stores(store_id),
    FOREIGN KEY (rep_id) REFERENCES Sales_Reps(rep_id)
);

-- Order Items Table
CREATE TABLE Order_Items (
    order_id VARCHAR(10),
    product_id INT,
    units_sold INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- SAMPLE INSERTS

INSERT INTO Customers VALUES 
('CUST001'), ('CUST002'), ('CUST003'), ('CUST004'), ('CUST005');

INSERT INTO Stores (store_name, store_city) VALUES
('Chennai Anna', 'Chennai'),
('Bangalore MG', 'Bangalore'),
('Mumbai Central', 'Mumbai'),
('Pune FC Road', 'Pune'),
('Delhi South', 'Delhi');

INSERT INTO Products (product_name, category, unit_price) VALUES
('Smartwatch', 'electronics', 58851.01),
('Phone', 'electronics', 48703.39),
('Jeans', 'clothing', 2317.47),
('Atta 10kg', 'grocery', 52464),
('Milk 1L', 'grocery', 43374.39);

INSERT INTO Sales_Reps (rep_name) VALUES
('Rahul'), ('Amit'), ('Neha'), ('Priya'), ('Karan');

INSERT INTO Orders VALUES
('TXN5000', '2023-08-29', 'CUST001', 1, 1),
('TXN5001', '2023-12-12', 'CUST002', 1, 2),
('TXN5002', '2023-02-05', 'CUST003', 2, 3),
('TXN5003', '2023-02-20', 'CUST004', 3, 4),
('TXN5004', '2023-01-15', 'CUST005', 4, 5);

INSERT INTO Order_Items VALUES
('TXN5000', 1, 3),
('TXN5001', 2, 11),
('TXN5002', 2, 20),
('TXN5003', 3, 14),
('TXN5004', 1, 10);
