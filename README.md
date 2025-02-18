# SQL Performance Bug: Function in WHERE Clause

This repository demonstrates a common SQL performance issue where using functions within the `WHERE` clause prevents index usage, leading to slower query execution.  The `bug.sql` file shows the problematic query, while `bugSolution.sql` offers an optimized alternative.

## Problem

The original query uses a function (`DATE_FORMAT`) on the `order_date` column within the `WHERE` clause. This prevents the database from using an index on `order_date`, resulting in a full table scan.

## Solution

The solution involves reframing the query to avoid using functions on indexed columns in the `WHERE` clause.  Instead, we directly compare against the date range to allow the database to use the index efficiently.

## How to Reproduce

1. Create a table with an indexed `order_date` column.
2. Insert a substantial amount of data into the table.
3. Execute the query in `bug.sql` and observe the execution time.
4. Execute the query in `bugSolution.sql` and compare the execution time.  You should see a significant improvement in performance.
