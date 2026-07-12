# 📘 SQL Syntax Cheat Sheet

## 🏗️ DDL (Data Definition Language)

### CREATE TABLE
```sql
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    ...
);
```

Example:
```sql
CREATE TABLE EMP(
    EMPNO NUMBER(6),
    ENAME VARCHAR2(20)
);
```

---

### ALTER TABLE

#### Add a Column
```sql
ALTER TABLE table_name
ADD column_name datatype;
```

#### Modify a Column
```sql
ALTER TABLE table_name
MODIFY column_name datatype;
```

#### Drop a Column
```sql
ALTER TABLE table_name
DROP COLUMN column_name;
```

---

### DROP TABLE
```sql
DROP TABLE table_name;
```

---

### TRUNCATE TABLE
```sql
TRUNCATE TABLE table_name;
```

---

### DESC
```sql
DESC table_name;
```

---

# ✏️ DML (Data Manipulation Language)

### INSERT
```sql
INSERT INTO table_name
VALUES(value1, value2, value3, ...);
```

Insert into specific columns:
```sql
INSERT INTO table_name(column1, column2)
VALUES(value1, value2);
```

---

### UPDATE

Update all rows:
```sql
UPDATE table_name
SET column_name = value;
```

Update selected rows:
```sql
UPDATE table_name
SET column_name = value
WHERE condition;
```

---

### DELETE

Delete selected rows:
```sql
DELETE FROM table_name
WHERE condition;
```

Delete all rows:
```sql
DELETE FROM table_name;
```

---

# 🔍 Query Commands

### SELECT

Display all columns:
```sql
SELECT *
FROM table_name;
```

Display selected columns:
```sql
SELECT column1, column2
FROM table_name;
```

---

### DISTINCT
```sql
SELECT DISTINCT column_name
FROM table_name;
```

---

### WHERE
```sql
SELECT *
FROM table_name
WHERE condition;
```

Comparison Operators:
```text
=
>
<
>=
<=
<>
```

---

### BETWEEN
```sql
SELECT *
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
```

Equivalent:
```sql
WHERE column_name >= value1
AND column_name <= value2;
```

---

### LIKE

Starts with:
```sql
WHERE column_name LIKE 'A%';
```

Ends with:
```sql
WHERE column_name LIKE '%A';
```

Contains:
```sql
WHERE column_name LIKE '%ABC%';
```

Single character:
```sql
WHERE column_name LIKE '_A%';
```

---

### ORDER BY

Ascending:
```sql
SELECT *
FROM table_name
ORDER BY column_name;
```

Descending:
```sql
SELECT *
FROM table_name
ORDER BY column_name DESC;
```

---

### AS (Alias)

Column Alias:
```sql
SELECT salary AS MonthlySalary
FROM Employee;
```

Table Alias:
```sql
SELECT E.name
FROM Employee AS E;
```

---

# 📊 Aggregate Functions

### COUNT
```sql
SELECT COUNT(*)
FROM table_name;
```

```sql
SELECT COUNT(column_name)
FROM table_name;
```

---

### SUM
```sql
SELECT SUM(column_name)
FROM table_name;
```

---

### AVG
```sql
SELECT AVG(column_name)
FROM table_name;
```

---

### MAX
```sql
SELECT MAX(column_name)
FROM table_name;
```

---

### MIN
```sql
SELECT MIN(column_name)
FROM table_name;
```

---

# 📂 GROUP BY

Syntax:
```sql
SELECT column_name, COUNT(*)
FROM table_name
GROUP BY column_name;
```

Example:
```sql
SELECT country, COUNT(*)
FROM Customers
GROUP BY country;
```

---

# 🎯 HAVING

Syntax:
```sql
SELECT column_name, COUNT(*)
FROM table_name
GROUP BY column_name
HAVING COUNT(*) > 1;
```

Example:
```sql
SELECT customer_id, SUM(amount)
FROM Orders
GROUP BY customer_id
HAVING SUM(amount) > 10000;
```

---

# 🔗 Set Operations

### UNION
```sql
SELECT column_name
FROM table1

UNION

SELECT column_name
FROM table2;
```

---

### UNION ALL
```sql
SELECT column_name
FROM table1

UNION ALL

SELECT column_name
FROM table2;
```

---

### INTERSECT
```sql
SELECT column_name
FROM table1

INTERSECT

SELECT column_name
FROM table2;
```

---

### MINUS (Oracle SQL)
```sql
SELECT column_name
FROM table1

MINUS

SELECT column_name
FROM table2;
```

---

# 🛡️ Constraints

### PRIMARY KEY
```sql
column_name datatype PRIMARY KEY
```

---

### NOT NULL
```sql
column_name datatype NOT NULL
```

---

### UNIQUE
```sql
column_name datatype UNIQUE
```

---

### CHECK
```sql
column_name datatype CHECK(condition)
```

Example:
```sql
AGE NUMBER(2) CHECK (AGE >= 18)
```

---

# 🧠 SQL Execution Order

```sql
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY;
```

---

# ✅ SQL Commands Covered

## DDL
- CREATE
- ALTER
- DROP
- TRUNCATE
- DESC

## DML
- INSERT
- UPDATE
- DELETE
- SELECT

## Clauses
- WHERE
- DISTINCT
- BETWEEN
- LIKE
- ORDER BY
- AS

## Aggregate Functions
- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()

## Grouping
- GROUP BY
- HAVING

## Set Operations
- UNION
- UNION ALL
- INTERSECT
- MINUS (Oracle SQL)
