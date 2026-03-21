## ETL Decisions

### Decision 1 — Standardizing Date Formats
Problem: The raw `retail_transactions.csv` file contained dates in different formats. Some rows used formats like `DD-MM-YYYY`, while others used `YYYY/MM/DD` or similar variations. This would create problems when grouping data by month, year, or quarter in the warehouse because the same type of date would not be stored consistently.

Resolution: All dates data was converted into one standard format: `YYYY-MM-DD`. After standardizing, I created the `dim_date` table using cleaned values such as day, month, quarter, and year. This made time-based analysis easier and ensured that monthly and yearly reporting would work correctly.

### Decision 2 — Filling Missing Store City Values
Problem: Some rows had `NULL` or missing values in the `store_city` column. If these missing values were loaded directly, the `dim_store` table would contain incomplete records, which would reduce reporting quality and make store-level analysis less reliable.

Resolution: I filled the missing `store_city` values by using the known mapping from `store_name`. For example, if a row had the store name `Mumbai Central`, I assigned the city as `Mumbai`. This made the store dimension complete and consistent, so all stores could be grouped and analyzed properly by city.

### Decision 3 — Correcting Category Name Inconsistencies
Problem: The product category values were not written consistently in the raw data. For example, the file contained values like `electronics` and `Electronics`, and also `Grocery` and `Groceries`. If loaded as-is, these would be treated as separate categories in reports, leading to incorrect totals.

Resolution: I standardized category names into a single clean format with proper casing. I converted all electronics-related values to `Electronics`, clothing values to `Clothing`, and grocery-related values to `Groceries`. This ensured that category-based BI reports, such as revenue by category, would produce accurate and meaningful results.Problem: The raw dataset contained inconsistent date formats such as "01-02-2026", "02/01/2026", and "2026/02/01". This made it difficult to group data by month or perform time-based analysis.
