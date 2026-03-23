## Storage Systems

The system uses a combination of operational databases, a data lake, and a data warehouse to support different use cases. A relational database such as PostgreSQL is used as the OLTP system to store real-time patient records, billing data, and transactional updates. This ensures high consistency and fast access for day-to-day hospital operations.

A data lake is used to store raw and unstructured data such as ICU streaming vitals, doctor notes, and historical logs. This allows the system to handle diverse data formats including text and time-series data. It is especially useful for machine learning workloads where raw historical data is required.

A data warehouse is used to store cleaned and structured data for reporting purposes. This enables efficient querying for monthly reports such as bed occupancy and department-wise costs. The warehouse is optimized for analytical queries and supports business intelligence tools.

Additionally, a feature store is used to serve curated features for machine learning models, specifically for predicting patient readmission risk. This ensures consistency between training and inference data.

## OLTP vs OLAP Boundary

The OLTP system consists of the operational database where real-time transactions such as patient admissions, updates, and billing occur. This system is optimized for high concurrency and low latency.

The OLAP system begins once data is extracted from the OLTP system and loaded into the data lake and data warehouse through ETL processes. The data lake acts as a staging area for raw data, while the data warehouse is used for structured analytics and reporting.

Machine learning models and BI dashboards operate on the OLAP layer. This separation ensures that analytical workloads do not impact the performance of transactional systems.

## Trade-offs

One significant trade-off in this design is the increased system complexity due to the use of multiple storage systems. Managing data consistency across the OLTP database, data lake, and data warehouse can be challenging.

To mitigate this, robust ETL pipelines and data validation mechanisms can be implemented to ensure data quality and consistency. Using a unified metadata layer or adopting a data lakehouse architecture can further reduce complexity by combining the benefits of both data lakes and warehouses.

Despite the complexity, this design provides scalability, flexibility, and the ability to support both real-time and analytical workloads effectively.
