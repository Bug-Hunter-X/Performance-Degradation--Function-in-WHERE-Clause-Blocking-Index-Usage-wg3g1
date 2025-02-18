The SQL query uses a function (e.g., `DATE_FORMAT`, `SUBSTR`) within a WHERE clause that prevents the database from using an index. This can lead to full table scans and significantly degrade performance, especially with large tables. 

```sql
SELECT * FROM orders WHERE DATE_FORMAT(order_date, '%Y-%m') = '2023-10';
```

In the example above, the `DATE_FORMAT` function applied to `order_date` prevents index usage on the `order_date` column, even if one exists.