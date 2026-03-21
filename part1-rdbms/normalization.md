## Anomaly Analysis

### 1. Insert Anomaly

In the current denormalized dataset, it is not possible to insert a new product or store without creating a transaction.

For example, all rows require fields such as `transaction_id`, `customer_id`, and `units_sold`. If the company wants to add a new product like "Camera", it cannot be stored independently unless a transaction exists.

This forces insertion of unnecessary data and leads to redundancy.

---

### 2. Update Anomaly

The dataset contains repeated product information across multiple rows.

For example, the product "Smartwatch" appears in multiple transactions such as:

- TXN5004  
- TXN5006  
- TXN5009  
- TXN5076  

All have the same `unit_price` = 58851.01.

If the price changes, it must be updated in all rows. Missing any row leads to inconsistent data.

---

### 3. Delete Anomaly

Deleting a transaction may remove important information.

For example, deleting:

- TXN5005 (Atta 10kg, Bangalore MG, Bangalore)

could remove all information about that product being sold at that store.

Thus, deleting transactional data can result in unintended loss of product or store information.



## Normalization Justification

While keeping all data in a single table may seem simpler, it introduces significant data integrity and maintenance issues. In the given dataset, multiple anomalies are evident due to denormalization.

For example, the product "Smartwatch" appears in multiple rows with the same unit price. If the price changes, it must be updated in every row where it appears. This creates an update anomaly and increases the risk of inconsistent data.

Similarly, inserting a new product without a transaction is not possible, as every row requires a transaction ID and customer ID. This demonstrates an insert anomaly, where unrelated data must be added unnecessarily.

A delete anomaly is also present. Deleting a transaction such as TXN5005 may result in losing all information about a product-store relationship if it is the only record.

Normalization addresses these issues by separating data into logical tables such as Customers, Products, Orders, and Stores. Each entity is stored only once, reducing redundancy and ensuring consistency.

Therefore, normalization is not over-engineering but a necessary step to maintain data integrity, scalability, and efficient data management in relational databases.
