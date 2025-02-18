To improve performance, refactor the query to avoid applying functions to indexed columns within the WHERE clause.  One approach is to convert the date comparison into a range check if possible. 

```sql
SELECT * FROM orders WHERE order_date >= '2023-10-01' AND order_date < '2023-11-01';
```

This allows the database to use indexes efficiently on the `order_date` column for faster query execution.  If the function is absolutely necessary, consider creating a separate indexed column with the pre-computed function result. 

```sql
-- Assuming you add a new column `order_year_month` for storing precomputed year-month values
SELECT * FROM orders WHERE order_year_month = '2023-10';
```