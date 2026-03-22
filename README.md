# Assignment-01-STU2511898
Assignment 02 submission

## Overview
- This repository contains solutions for **6 major parts** of a database systems assignment.
- The submission covers:
  - **Relational database design and normalization**
  - **NoSQL document modeling and MongoDB operations**
  - **Data warehouse design and OLAP queries**
  - **Vector embeddings and semantic similarity**
  - **Data lake / DuckDB work**
  - **Capstone architecture design for a hospital AI-powered data platform**

### 1. `part1-rdbms`
- **Relational databases, normalization, schema design, and SQL querying**
- Files included:
  - `normalization.md`
    - Contains anomaly analysis from the flat file
    - Explains insert anomaly, update anomaly, and delete anomaly
    - Includes normalization justification
  - `schema_design.sql`
    - Contains the normalized schema in SQL
    - Includes `CREATE TABLE` statements
    - Includes primary keys, foreign keys, data types, and constraints
    - Includes sample `INSERT` statements
  - `queries.sql`
    - Contains required SQL queries for the normalized schema
    - Includes customer, product, order, and sales representative analysis queries

### 2. `part2-nosql`
- **MongoDB document design and NoSQL vs RDBMS comparison**
- Files included:
  - `sample_documents.json`
    - Contains sample MongoDB documents
    - Covers exactly 3 categories:
      - Electronics
      - Clothing
      - Groceries
    - Includes nested fields and arrays where appropriate
  - `mongo_queries.js`
    - Contains MongoDB operations
    - Includes:
      - `insertMany()`
      - `find()` queries
      - `updateOne()`
      - `createIndex()`
  - `rdbms_vs_nosql.md`
    - Contains the recommendation write-up comparing MySQL and MongoDB
    - Discusses ACID vs BASE
    - Discusses CAP theorem
    - Includes a healthcare system recommendation and fraud detection extension

### 3. `part3-datawarehouse`
- **Star schema design, ETL cleaning decisions, and OLAP-style queries**
- Files included:
  - `star_schema.sql`
    - Contains the star schema design
    - Includes:
      - `fact_sales`
      - `dim_date`
      - `dim_store`
      - `dim_product`
    - Includes sample cleaned inserts
    - Reflects standardization of inconsistent raw data
  - `dw_queries.sql`
    - Contains analytical SQL queries for the warehouse
    - Includes:
      - Total sales by category and month
      - Top performing stores
      - Month-over-month sales trend
  - `etl_notes.md`
    - Documents ETL decisions
    - Explains raw data problems and how they were resolved before loading into the warehouse

### 4. `part4-vector-db`
- **Embeddings, similarity search, and vector database reflection**
- Files included:
  - `embeddings_demo.ipynb`
    - Google Colab notebook
    - Contains:
      - 10 sentences across exactly 3 topics:
        - Cricket
        - Cooking
        - Cybersecurity
      - Embedding generation using `sentence-transformers`
      - Cosine similarity computation
      - Heatmap visualization
      - Top-2 similarity results for the given cricket query
  - `vector_db_reflection.md`
    - Explains why vector databases are useful for semantic search in long legal documents
    - Compares semantic retrieval with traditional keyword-based search

### 5. `part5-datalake`
- **Data lake architecture and DuckDB-based querying**
- Files included:
  - `architecture_choice.md`
    - Explains the selected architecture and storage/querying approach
  - `duckdb_queries.sql`
    - Contains analytical queries written for DuckDB

### 6. `part6-capstone`
- **End-to-end system design for a hospital AI-powered data platform**
- Files included:
  - `architecture_diagram.png`
    - Visual architecture diagram
    - Shows:
      - data sources
      - ingestion layer
      - storage systems
      - AI / analytics layer
      - reporting / consumption layer
  - `design_justification.md`
    - Explains the architecture decisions
    - Covers:
      - storage systems selected for each use case
      - OLTP vs OLAP boundary
      - trade-offs and mitigation

## Final Summary
- This repository is structured to show both **technical implementation** and **design reasoning**.
- It combines:
  - hands-on database work
  - modeling choices
  - ETL/data cleaning logic
  - analytical design
  - semantic search concepts
  - system architecture thinking
- The folder structure is designed to make grading and navigation simple.
