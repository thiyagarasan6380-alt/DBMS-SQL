# 📘 SQL Syntax Reference

## CREATE TABLE
```sql
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    ...
);
```

## ALTER TABLE

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

## DROP TABLE
```sql
DROP TABLE table_name;
```

## TRUNCATE TABLE
```sql
TRUNCATE TABLE table_name;
```

## DESC
```sql
DESC table_name;
```

---

# DML Commands

## INSERT
```sql
INSERT INTO table_name
VALUES(value1, value2, value3, ...);
```

## UPDATE
```sql
UPDATE table_name
SET column_name = value
WHERE condition;
```

## DELETE
```sql
DELETE FROM table_name
WHERE condition;
```

## SELECT
```sql
SELECT column1, column2
FROM table_name;
```

---

# SQL Clauses

## WHERE
```sql
SELECT *
FROM table_name
WHERE condition;
```

## DISTINCT
```sql
SELECT DISTINCT column_name
FROM table_name;
```

## ORDER BY (Ascending)
```sql
SELECT *
FROM table_name
ORDER BY column_name;
```

## ORDER BY (Descending)
```sql
SELECT *
FROM table_name
ORDER BY column_name DESC;
```

## BETWEEN
```sql
SELECT *
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
```

## LIKE

Starts with
```sql
SELECT *
FROM table_name
WHERE column_name LIKE 'A%';
```

Ends with
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

## AS (Alias)
```sql
SELECT column_name AS alias_name
FROM table_name;
```

---

# Aggregate Functions

## COUNT
```sql
SELECT COUNT(*)
FROM table_name;
```

## SUM
```sql
SELECT SUM(column_name)
FROM table_name;
```

## AVG
```sql
SELECT AVG(column_name)
FROM table_name;
```

## MAX
```sql
SELECT MAX(column_name)
FROM table_name;
```

## MIN
```sql
SELECT MIN(column_name)
FROM table_name;
```

---

# GROUP BY
```sql
SELECT column_name, COUNT(*)
FROM table_name
GROUP BY column_name;
```

---

# HAVING
```sql
SELECT column_name, COUNT(*)
FROM table_name
GROUP BY column_name
HAVING COUNT(*) > 1;
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

## UNION ALL
```sql
SELECT column_name
FROM table1
UNION ALL
SELECT column_name
FROM table2;
```

## INTERSECT
```sql
SELECT column_name
FROM table1
INTERSECT
SELECT column_name
FROM table2;
```

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
SELECT column_name
FROM table1
NATURAL JOIN table2;
```

## INNER JOIN
```sql
SELECT column_name
FROM table1
JOIN table2
ON table1.common_column = table2.common_column;
```

## LEFT OUTER JOIN
```sql
SELECT column_name
FROM table1
LEFT JOIN table2
ON table1.common_column = table2.common_column;
```

## RIGHT OUTER JOIN
```sql
SELECT column_name
FROM table1
RIGHT JOIN table2
ON table1.common_column = table2.common_column;
```

## FULL OUTER JOIN
```sql
SELECT column_name
FROM table1
FULL OUTER JOIN table2
ON table1.common_column = table2.common_column;
```

---

# VIEW

## CREATE VIEW
```sql
CREATE VIEW view_name AS
SELECT column_name
FROM table_name;
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
