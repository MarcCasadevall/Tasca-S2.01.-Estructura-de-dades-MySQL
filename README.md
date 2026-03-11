📊 Database Design: Optical Store & Pizzeria
Description: This repository contains the data modeling, schema implementation, and business logic for two distinct database projects. It includes Entity-Relationship (ER) diagrams, SQL scripts, and specific queries to solve real-world business requirements.

📌 Project Briefs
1. Exercise 1: Optical Store
A system designed to manage suppliers, glasses (brands and technical specs), customers, and employees. Key features include a customer referral system and sales tracking.

2. Exercise 2: Pizzeria
A comprehensive system for an online food delivery platform. It manages multiple physical stores, employees (categorized as cooks or drivers), various product types (pizzas, burgers, drinks), and localized delivery logistics.

✨ Key Features
Sales Traceability: Detailed records of every transaction, including the responsible employee and timestamps.

Geographic Logic: Normalized structure for Provinces and Localities to ensure data integrity for deliveries.

Business Reporting:

Filter sales by custom time periods and specific employees.

Calculate product sales volume by locality.

Identify successful suppliers based on actual sales data.

🛠 Tech Stack
Design Tool: MySQL Workbench (.mwb files).

Database Engine: MySQL 8.0+.

Language: SQL (DDL for structure, DML for testing).

🚀 Setup and Execution
Clone the repository:

git clone https://github.com/your-username/repository-name.git

Import the Schema:

Execute the schema_optica.sql and schema_pizzeria.sql files in your database management tool (MySQL Workbench, DBeaver, etc.).

Populate Data:

Execute the corresponding inserts.sql files to load test data.

Run Queries:

Open the query files to find pre-written SQL statements that verify the business requirements.

📸 Demo
Optical Store ER Diagram
Pizzeria ER Diagram
🧩 Architectural Decisions
Normalization: Localities and Provinces are separated into independent tables to avoid data redundancy and maintain the "Single Source of Truth."

Recursive Relationships: In the customer table (Optical Store), a self-referencing Foreign Key is used to handle the "Recommended by" logic.

Data Integrity: Used DECIMAL for financial values to prevent rounding errors and ENUM types for roles and product categories to enforce strict business rules.
