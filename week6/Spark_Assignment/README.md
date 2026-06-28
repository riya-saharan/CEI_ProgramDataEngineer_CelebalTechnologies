# Week 6 - Spark Intro Assignment

## Objective

This assignment demonstrates the basics of Apache Spark using PySpark. It covers Spark architecture, DataFrame creation with schema, data cleaning, transformations, actions, filtering, grouping, partitioning, and CSV/Parquet file handling.

## Spark Architecture

Apache Spark follows a distributed architecture.

- **Driver**: Runs the main program and coordinates Spark jobs.
- **Executors**: Worker processes that execute tasks on data partitions.
- **Cluster Manager**: Allocates resources to Spark applications.
- **DAG**: Spark creates a Directed Acyclic Graph to optimize execution.
- **Lazy Evaluation**: Transformations are executed only when an action such as `show()` or `write()` is called.

## Dataset

The input dataset is stored in:

```text
data/sales_data.csv
```

It contains sample sales records with columns such as:

```text
id, name, age, city, category, sales, quantity, order_date
```

## Operations Performed

The PySpark script performs the following operations:

1. Creates a SparkSession.
2. Reads CSV data using a defined schema.
3. Displays original data and schema.
4. Removes duplicate rows.
5. Handles null values using `fillna()`.
6. Renames columns using `withColumnRenamed()`.
7. Casts data types and converts order date to date format.
8. Adds new columns such as `total_amount`, `sales_level`, and `processed_by`.
9. Filters records where sales are greater than 10000 and city is not unknown.
10. Performs `groupBy()` aggregation by category and city.
11. Uses repartitioning based on category.
12. Includes CSV and Parquet write logic.
13. Displays execution plan using `explain()`.

## Output Sections

The script prints the following output sections:

```text
SPARK ARCHITECTURE INFO
ORIGINAL DATA
ORIGINAL SCHEMA
AFTER REMOVING DUPLICATES AND HANDLING NULLS
TRANSFORMED DATA
TRANSFORMED SCHEMA
FILTERED DATA
CATEGORY WISE SUMMARY
CITY WISE SUMMARY
PARTITION INFORMATION
WRITING OUTPUT FILES
EXECUTION PLAN
BRIEF INSIGHTS
```

## Windows Note

On Windows, Spark may require proper Hadoop native files such as `winutils.exe` and `hadoop.dll` for local CSV/Parquet writing.
The script includes fallback handling so that transformations, actions, filtering, grouping, partitioning, and execution plan still complete successfully.

## Key Insights

1. CSV is readable but slower because it stores row-based text data.
2. Parquet is faster for analytics because it is columnar and compressed.
3. `filter()`, `groupBy()`, `withColumn()`, and `repartition()` are transformations.
4. `show()` and `write()` are actions that trigger Spark execution.
5. Lazy evaluation helps Spark optimize the DAG before execution.
6. Partitioning by category improves performance when filtering by category.
7. `show()` is safer than `collect()` because `collect()` brings all data to the driver.

## How to Run

Run the following commands:

```powershell
cd "C:\Users\Riya Saharan\Desktop\CEI_ProgramDataEngineer_CelebalTechnologies\week6\Spark_Assignment"

$env:JAVA_HOME="C:\Program Files\Java\jdk-17"
$env:HADOOP_HOME="C:\hadoop"
$env:Path="$env:JAVA_HOME\bin;$env:HADOOP_HOME\bin;$env:Path"

python .\spark_assignment.py
```

## Files Included

```text
Spark_Assignment/
│
├── data/
│   └── sales_data.csv
│
├── output/
│   ├── processed_csv/
│   ├── processed_parquet/
│   ├── category_summary_csv/
│   ├── partitioned_by_category_parquet/
│   └── WINDOWS_HADOOP_NOTE.txt
│
├── spark_assignment.py
├── requirements.txt
└── README.md
```
