# 📘 SQL Syntax Cheat Sheet

## 1. CREATE TABLE
```sql
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    ...
);
```

Example:
```sql
CREATE TABLE Employee(
    EmpNo NUMBER(6),
    Name VARCHAR2(30),
    Salary NUMBER(8)
);
```

---

## 2. ALTER TABLE

### Add Column
```sql
ALTER TABLE table_name
ADD column_name datatype;
```

### Modify Column
```sql
ALTER TABLE table_name
MODIFY column_name datatype;
```

### Drop Column
```sql
ALTER TABLE table_name
DROP COLUMN column_name;
```

---

## 3. DROP TABLE
```sql
DROP TABLE table_name;
```

---

## 4. TRUNCATE TABLE
```sql
TRUNCATE TABLE table_name;
```

---

## 5. DESC
```sql
DESC table_name;
```

---

# DML Commands

## 6. INSERT
```sql
INSERT INTO table_name
VALUES(value1, value2, value3, ...);
```

Specific Columns
```sql
INSERT INTO table_name(column1, column2)
VALUES(value1, value2);
```

---

## 7. UPDATE
```sql
UPDATE table_name
SET column_name = value
WHERE condition;
```

Update All Rows
```sql
UPDATE table_name
SET column_name = value;
```

---

## 8. DELETE
```sql
DELETE FROM table_name
WHERE condition;
```

Delete All Rows
```sql
DELETE FROM table_name;
```

---

# Query Commands

## 9. SELECT
```sql
SELECT column1, column2
FROM table_name;
```

All Columns
```sql
SELECT *
FROM table_name;
```

---

## 10. DISTINCT
```sql
SELECT DISTINCT column_name
FROM table_name;
```

---

## 11. WHERE
```sql
SELECT *
FROM table_name
WHERE condition;
```

---

## 12. ORDER BY

Ascending
```sql
SELECT *
FROM table_name
ORDER BY column_name;
```

Descending
```sql
SELECT *
FROM table_name
ORDER BY column_name DESC;
```

---

## 13. BETWEEN
```sql
SELECT *
FROM table_name
WHERE column_name
BETWEEN value1 AND value2;
```

---

## 14. LIKE

Starts With
```sql
SELECT *
FROM table_name
WHERE column_name LIKE 'A%';
```

Ends With
```sql
SELECT *
FROM table_name
WHERE column_name LIKE '%A';
```

Contains
```sql
SELECT *
FROM table_name
WHERE column_name LIKE '%ABC%';
```

Single Character
```sql
SELECT *
FROM table_name
WHERE column_name LIKE '_A%';
```

---

## 15. Alias (AS)
```sql
SELECT column_name AS alias_name
FROM table_name;
```

---

# Aggregate Functions

## COUNT()
```sql
SELECT COUNT(*)
FROM table_name;
```

---

## SUM()
```sql
SELECT SUM(column_name)
FROM table_name;
```

---

## AVG()
```sql
SELECT AVG(column_name)
FROM table_name;
```

---

## MAX()
```sql
SELECT MAX(column_name)
FROM table_name;
```

---

## MIN()
```sql
SELECT MIN(column_name)
FROM table_name;
```

---

# GROUP BY
```sql
SELECT column_name,
       COUNT(*)
FROM table_name
GROUP BY column_name;
```

---

# HAVING
```sql
SELECT column_name,
       COUNT(*)
FROM table_name
GROUP BY column_name
HAVING COUNT(*) > value;
```

---

# Set Operations

## UNION
```sql
SELECT column_name
FROM table1

UNION

SELECT column_name
FROM table2;
```

---

## UNION ALL
```sql
SELECT column_name
FROM table1

UNION ALL

SELECT column_name
FROM table2;
```

---

## INTERSECT
```sql
SELECT column_name
FROM table1

INTERSECT

SELECT column_name
FROM table2;
```

---

## MINUS (Oracle SQL)
```sql
SELECT column_name
FROM table1

MINUS

SELECT column_name
FROM table2;
```

---

# SQL Joins

## NATURAL JOIN
```sql
SELECT columns
FROM table1
NATURAL JOIN table2;
```

---

## INNER JOIN
```sql
SELECT columns
FROM table1
INNER JOIN table2
ON table1.common_column = table2.common_column;
```

---

## LEFT OUTER JOIN
```sql
SELECT columns
FROM table1
LEFT OUTER JOIN table2
ON table1.common_column = table2.common_column;
```

---

## RIGHT OUTER JOIN
```sql
SELECT columns
FROM table1
RIGHT OUTER JOIN table2
ON table1.common_column = table2.common_column;
```

---

## FULL OUTER JOIN
```sql
SELECT columns
FROM table1
FULL OUTER JOIN table2
ON table1.common_column = table2.common_column;
```

---

# Views

## CREATE VIEW
```sql
CREATE VIEW view_name AS
SELECT columns
FROM table_name;
```

---

# Constraints

## PRIMARY KEY
```sql
column_name datatype PRIMARY KEY
```

---

## NOT NULL
```sql
column_name datatype NOT NULL
```

---

## UNIQUE
```sql
column_name datatype UNIQUE
```

---

## CHECK
```sql
column_name datatype CHECK(condition)
```

Example
```sql
AGE NUMBER(2) CHECK(AGE >= 18)
```

---

## FOREIGN KEY
```sql
FOREIGN KEY(column_name)
REFERENCES parent_table(parent_column);
```

---

# SQL Query Execution Order

```text
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
```
