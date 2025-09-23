This is a data project aimed at consuming, processing, and making available data from a fictional company called Adventure Works, covering the years 2011 to 2014.

The project was built using dbt integrated with Github and Snowflake.

The data architecture is structured using the staging, intermediate, and marts layers, each serving distinct purposes. The models in the staging layer are essentially copies of the source data, with some 
simple transformations, such as type casting and column renaming. The intermediate layer is where more complex transformations, such as joins and data cleaning, are performed. Finally, the marts layer represents 
the final data models, ready for use in analytics tools like Power BI.

The models include unit tests and non-null checks, and for the fact_sales table, foreign key tests are also implemented.

Best practices for naming conventions, code writing, and project organization have been followed to maintain consistency throughout the project and facilitate future maintenance or enhancements.
