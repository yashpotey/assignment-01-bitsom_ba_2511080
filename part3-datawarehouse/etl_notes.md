## ETL Decisions

### Decision 1 — Standardizing Date Format
Problem: The raw dataset contains dates in DD-MM-YYYY format, which is not ideal for analytical queries and joins.

Resolution: All dates were converted into standard ISO format (YYYY-MM-DD) and a surrogate key (date_id in YYYYMMDD format) was created for efficient joins in the warehouse.

---

### Decision 2 — Handling Missing Store City Values
Problem: Some records had NULL or missing values in the `store_city` field (e.g., TXN5033, TXN5044).

Resolution: Missing values were replaced with 'Unknown' to maintain referential integrity and avoid NULL-related issues in joins and aggregations.

---

### Decision 3 — Standardizing Category Values
Problem: The dataset had inconsistent category values such as 'electronics' and 'Electronics', and 'Grocery' vs 'Groceries'.

Resolution: All category values were converted to lowercase and standardized into three categories: 'electronics', 'clothing', and 'grocery' to ensure consistent aggregation and reporting.
