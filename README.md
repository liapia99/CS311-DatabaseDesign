# CS311-DatabaseDesign

Learning Outcomes:
By the end of this project, you should be able to:

Design a comprehensive, normalized database schema.
Define and enforce relationships between different entities using primary and foreign keys.
Write complex SQL queries involving joins, aggregations, and subqueries.
Implement constraints to ensure data integrity and business rules (e.g., UNIQUE, NOT NULL, CHECK).
Optimize queries and understand the importance of indexing and performance tuning.


Project Requirements:
1. Database Schema Design:
Entities: You are required to create at least 7 main entities (tables) with appropriate relationships (one-to-one, one-to-many, or many-to-many).
Attributes: Each entity should have relevant attributes (fields), ensuring that each attribute is atomic (1NF) and that the database is normalized up to 3NF.
Relationships: Define how these entities are related. Use foreign keys to represent relationships between entities (e.g., a student can register for multiple courses, an order contains multiple products).
Constraints: Implement necessary constraints such as:
Primary Keys: Ensure every table has a unique identifier.
Foreign Keys: Represent relationships between tables.
Unique Constraints: Ensure that certain columns (e.g., email or ID) have unique values.
Not Null: Identify fields that must always have values.
Check Constraints: Implement any necessary business rules (e.g., order quantity > 0, or salary > 1000).
2. Data Insertion and Population:
Insert a minimum of 5 records per table for at least 3-4 of your entities (depending on the complexity of your schema).


3. SQL Queries:
Write SQL queries to perform the following tasks:

Data Retrieval: Retrieve relevant data using SELECT statements (with filtering, sorting, and grouping).
Example: Find all customers who have placed orders worth more than $1000.
Aggregations: Perform aggregate calculations like COUNT, SUM, AVG, MAX, and MIN.
Example: Calculate the total sales for each product category.
Joins: Use SQL JOIN (INNER, LEFT, RIGHT, FULL) to combine data from multiple tables.
Example: Retrieve a list of all students enrolled in a particular course along with their grades.
Subqueries: Write subqueries to retrieve data from a nested query.
Example: List all products whose prices are above the average price of all products in the same category.
Data Manipulation: Implement INSERT, UPDATE, and DELETE operations.
Example: Update the inventory count when an order is placed or delete expired records from the database.
