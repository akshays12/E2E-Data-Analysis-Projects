# Walmart Data Analysis: End-to-End SQL + Python Project

## Project Overview

This project is an end-to-end data analysis solution designed to extract critical business insights from Walmart sales data. We utilize Python for data processing and analysis, SQL for advanced querying, and structured problem-solving techniques to solve key business questions.

---

## Project Steps

### 1. Explore the Data
   - **Goal**: Conducted an initial data exploration to understand data distribution, checked column names, types, and identified potential issues.
   - **Analysis**: Used functions like `.info()`, `.describe()`, and `.head()` to get a quick overview of the data structure and statistics.

### 2. Data Cleaning
   - **Remove Duplicates**: Identified and removed duplicate entries to avoid skewed results.
   - **Handle Missing Values**: Dropped rows or columns with missing values if they are insignificant; fill values where essential.
   - **Fix Data Types**: Ensured all columns have consistent data types (e.g., dates as `datetime`, prices as `float`).
   - **Currency Formatting**: Used `.replace()` to handle and format currency values for analysis.
   - **Validation**: Checked for any remaining inconsistencies and verify the cleaned data.

### 3. Feature Engineering
   - **Create New Columns**: Calculated the `Total Amount` for each transaction by multiplying `unit_price` by `quantity` and adding this as a new column.
   - **Enhance Dataset**: Adding this calculated field will streamline further SQL analysis and aggregation tasks.

### 4. Load Data into PostgreSQL
   - **Set Up Connections**: Connected to MySQL and PostgreSQL using `sqlalchemy` and load the cleaned data into each database.
   - **Table Creation**: Set up tables in both MySQL and PostgreSQL using Python SQLAlchemy to automate table creation and data insertion.
   - **Verification**: Ran initial SQL queries to confirm that the data has been loaded accurately.

### 5. SQL Analysis: Complex Queries and Business Problem Solving
   - **Business Problem-Solving**: Executed complex SQL queries to answer critical business questions, such as:
     - Revenue trends across branches and categories.
     - Identifying best-selling product categories.
     - Sales performance by time, city, and payment method.
     - Analyzing peak sales periods and customer buying patterns.
     - Profit margin analysis by branch and category.

---

## Requirements

- **Python 3.8+**
- **SQL Databases**: MySQL, PostgreSQL
- **Python Libraries**:
  - `pandas`, `numpy`, `sqlalchemy`, `mysql-connector-python`, `psycopg2`

## Results and Insights

This section will include your analysis findings:
- **Sales Insights**: Key categories, branches with highest sales, and preferred payment methods.
- **Profitability**: Insights into the most profitable product categories and locations.
- **Customer Behavior**: Trends in ratings, payment preferences, and peak shopping hours.

