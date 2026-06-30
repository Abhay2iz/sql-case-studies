# Case Study 1: Retail Analytics & Advanced SQL

## Problem Statement

As a database administrator, the goal is to analyze customer sales and profit data across different US states, examine marketing spend, COGS (Cost of Goods Sold), budget vs. actual performance, and identify which products sell the most.

## Dataset

| Table | Description |
|-------|-------------|
| `fact` | Date, ProductID, Profit, Sales, Margin, COGS, Total Expenses, Marketing, Inventory, Budget Profit, Budget COGS, Budget Margin, Budget Sales, Area Code |
| `Product` | ProductID, Product Type, Product, Type |
| `Location` | Area Code, State, Market, Market Size |

## Topics Covered

- Aggregate functions (`SUM`, `AVG`, `MIN`, `MAX`, `COUNT`)
- `GROUP BY` / `HAVING`
- Multi-table `JOIN`s
- Window functions (`DENSE_RANK`)
- `CASE` expressions
- `GROUP BY ... ROLLUP`
- Set operators (`UNION`, `INTERSECT`)
- Stored procedures and user-defined functions (UDFs)
- Transactions (`BEGIN TRANSACTION`, `ROLLBACK`, `COMMIT`)
- String functions (`ASCII`, `SUBSTRING`)

## Files

- [`schema/create_tables.sql`](./schema/create_tables.sql) — Database and table creation
- [`solutions.sql`](./solutions.sql) — All 29 queries, commented and numbered to match the original problem statement

## Notes on Fixes

A couple of corrections were made while testing the original queries in SSMS:
- **Q5 (max COGS):** switched from `ORDER BY Sales DESC` to `MAX(COGS)` directly, since ordering by sales doesn't guarantee the highest COGS value.
- **Q24 (UNION/INTERSECT):** added the missing `INTERSECT` query — the original only covered `UNION`.

## Sample Insight

> Colorado generated a total profit of **17,743** across all products, with Area Code 719 averaging **186.58** in sales per transaction.
