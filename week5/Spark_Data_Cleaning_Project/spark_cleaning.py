from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum, avg, when

spark = SparkSession.builder \
    .appName("DataCleaningProject") \
    .getOrCreate()

df = spark.read.csv(
    "data/sales_data.csv",
    header=True,
    inferSchema=True
)

print("Original Data")
df.show()

print("Schema")
df.printSchema()

df = df.dropDuplicates(["name", "age", "city", "category", "sales"])

df = df.fillna({
    "age": 0,
    "city": "Unknown",
    "sales": 0
})

df = df.withColumn(
    "sales_level",
    when(col("sales") > 5000, "High")
    .otherwise("Low")
)

print("Cleaned Data")
df.show()

filtered_df = df.filter(col("sales") > 3000)

print("Filtered Data")
filtered_df.show()

grouped_df = filtered_df.groupBy("category").agg(
    sum("sales").alias("total_sales"),
    avg("sales").alias("avg_sales")
)

print("Aggregated Data")
grouped_df.show()

spark.stop()
