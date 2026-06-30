# Case Study 2: Employee Database

## Problem Statement

A classic HR-style relational database with four related tables (`LOCATION`, `DEPARTMENT`, `JOB`, `EMPLOYEE`). The case study covers a progression of SQL topics — from simple SELECTs through joins, conditional grades, and correlated subqueries — to answer real business questions about employees, departments, and compensation.

## Dataset

| Table | Description |
|-------|-------------|
| `LOCATION` | Location ID (PK), City |
| `DEPARTMENT` | Department ID (PK), Name, Location ID (FK) |
| `JOB` | Job ID (PK), Designation |
| `EMPLOYEE` | Employee ID (PK), Name fields, Job ID (FK), Manager ID, Hire Date, Salary, Commission, Department ID (FK) |

## Topics Covered

- Simple `SELECT` queries with column aliases
- `WHERE` conditions, `LIKE` pattern matching, `BETWEEN`, `IN`
- `ORDER BY` (single and multi-column)
- `GROUP BY` / `HAVING`, date functions (`MONTH`, `YEAR`)
- `JOIN`s across 3 tables
- `CASE` expressions for salary grading
- Subqueries: scalar, correlated, `ALL`, `NOT IN`
- `UPDATE` using a subquery

## Files

- [`schema/create_tables.sql`](./schema/create_tables.sql) — Table creation + sample data inserts
- [`solutions.sql`](./solutions.sql) — All queries organized by topic, commented and numbered

## Notes on Fixes

A couple of corrections were made while testing the original script in SSMS:
- **Duplicate `JOB` table:** the original script created the `JOB` table twice with conflicting column sizes, which would throw an error on the second `CREATE TABLE`. Consolidated into a single definition.
- **Missing primary key:** added `PRIMARY KEY` on `EMPLOYEE.Employee_Id`, which was missing in the original schema.

## How to Run

1. Execute `schema/create_tables.sql` first to create and populate the tables.
2. Run any section of `solutions.sql` independently — each query is self-contained.
