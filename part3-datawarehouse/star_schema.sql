-- =========================
-- DIMENSION TABLES
-- =========================

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,         -- YYYYMMDD
    full_date DATE NOT NULL,
    day INT,
    month INT,
    month_name VARCHAR(20),
    year INT
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(50) NOT NULL,
    store_city VARCHAR(50) NOT NULL
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- =========================
-- FACT TABLE
-- =========================

CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY AUTO_INCREMENT,
    date_id INT,
    store_id INT,
    product_id INT,
    units_sold INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL,

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- =========================
-- INSERT CLEANED DIM DATA
-- =========================

-- Dates (standardized YYYY-MM-DD)
INSERT INTO dim_date VALUES
(20230115, '2023-01-15', 15, 1, 'January', 2023),
(20230205, '2023-02-05', 5, 2, 'February', 2023),
(20230331, '2023-03-31', 31, 3, 'March', 2023),
(20230428, '2023-04-28', 28, 4, 'April', 2023),
(20230521, '2023-05-21', 21, 5, 'May', 2023),
(20230604, '2023-06-04', 4, 6, 'June', 2023),
(20230722, '2023-07-22', 22, 7, 'July', 2023),
(20230815, '2023-08-15', 15, 8, 'August', 2023),
(20230927, '2023-09-27', 27, 9, 'September', 2023),
(20231020, '2023-10-20', 20, 10, 'October', 2023);

-- Stores (NULL city fixed as 'Unknown')
INSERT INTO dim_store (store_name, store_city) VALUES
('Chennai Anna', 'Chennai'),
('Bangalore MG', 'Bangalore'),
('Mumbai Central', 'Mumbai'),
('Pune FC Road', 'Pune'),
('Delhi South', 'Delhi'),
('Mumbai Central', 'Unknown');

-- Products (category standardized to lowercase)
INSERT INTO dim_product (product_name, category) VALUES
('Smartwatch', 'electronics'),
('Phone', 'electronics'),
('Jeans', 'clothing'),
('Atta 10kg', 'grocery'),
('Milk 1L', 'grocery');

-- =========================
-- FACT TABLE (CLEANED DATA)
-- =========================

INSERT INTO fact_sales (date_id, store_id, product_id, units_sold, unit_price, total_amount) VALUES
(20230115, 1, 1, 10, 58851.01, 588510.10),
(20230205, 1, 2, 20, 48703.39, 974067.80),
(20230331, 4, 1, 6, 58851.01, 353106.06),
(20230428, 3, 5, 10, 43374.39, 433743.90),
(20230521, 2, 2, 13, 48703.39, 633144.07),
(20230604, 1, 3, 15, 30187.24, 452808.60),
(20230722, 1, 4, 3, 52464.00, 157392.00),
(20230815, 2, 1, 3, 58851.01, 176553.03),
(20230927, 3, 1, 14, 49262.78, 689679.00),
(20231020, 3, 3, 13, 2317.47, 30127.11);
