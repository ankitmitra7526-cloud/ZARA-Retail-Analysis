# ZARA-Retail-Analysis Project: End-to-End Data Pipeline

This project presents a complete retail analytics workflow using a dataset of 20,000+ ZARA product records collected from Kaggle. The full pipeline covers data acquisition, cleaning, exploration, database management, analytical querying, visualization, and business reporting, delivered through Excel, Python, SQL, and Power BI.

📌 Project Pipeline Overview
1. Data Collection – Kaggle : [https://www.kaggle.com/datasets/ayeshaseherr/buisness-sales?resource=download]

Downloaded raw product dataset from Kaggle.

Data format: single-line CSV with multiple fields embedded in each row (wide, unstructured text format).

Loaded into Excel for initial restructuring.

2. Excel Preprocessing

Applied Text-to-Columns to split messy, comma-separated fields into structured columns.

Converted data into an Excel Table (Ctrl + T) for consistency before importing into Python.

Exported cleaned version for further processing.

3. Python (Pandas) – Data Cleaning & EDA

Imported dataset using Pandas.

Performed:

Handling missing values

Formatting price, category, and Boolean fields

Feature engineering (e.g., revenue = price × sales_volume)

Exploratory Data Analysis: distributions, price patterns, seasonal sales behavior

Exported fully cleaned dataset into CSV for SQL storage.

4. SQL (MySQL) – Analytical Querying

Created database and tables to store cleaned data.

Performed analytical queries including:

Revenue calculations

Category-level aggregations

Seasonal sales analysis

Pareto 80/20 revenue contribution

Material and sourcing-related insights

Used SQL to validate trends seen in EDA.

5. Power BI – Interactive Dashboard Development

Built four fully designed dashboards with a consistent UI theme and page-navigation tabs:

Page 1 – Overview

Total Revenue, Units Sold, Average Price

Seasonal volume, section revenue, price-category revenue

Top products by revenue

Page 2 – Product Performance

Number of products, revenue/product, units/product

Top performers by units / revenue / price elasticity

Product types analysis & price sensitivity plotting

Page 3 – Sales Trends

Total transactions & seasonal KPIs

Promotion comparison

Seasonal earning heatmap

Units sold by section

Customer segmentation by price category

Page 4 – Material & Supply Chain

Top materials by revenue & volume

Sourcing country distribution

Supplier dependency treemap

Material–location heatmap mapping the sourcing network

All measures created using DAX, including revenue, elasticity metrics, cumulative percentages, and top-N extractions.

6. Final Presentation – Gamma.App

Summarized the entire project in a professional slide deck.

Included KPIs, charts, methodology, insights, and business recommendations.

Final deliverable blends technical depth with business storytelling.

📊 Key Business Insights

WOMAN category contributes almost 2× revenue compared to MAN.

Autumn is the strongest season in both revenue and units.

Medium-priced products contribute ~46% of total revenue.

Wool, Cotton, and Polyester dominate material usage.

China is the most dominant sourcing country, creating supply concentration risk.

🛠 Technologies Used

Excel – Raw cleanup, structuring, preprocessing

Python (Pandas) – Cleaning, EDA, feature engineering

MySQL – Storage, analytical queries, Pareto analysis

Power BI – Dashboards, DAX measures, navigation system

Gamma.app – Final project presentation

📁 Repository Contents

Zara_Cleaned_Data.xlsx – cleaned datasets

Zara Retail Analysis .ipynb – Python EDA scripts

Zara Retail Analysis.sql – Schema and analytical SQL queries

Zara Retail Analysis.pbix – PBIX dashboard file

Project Report.pdf – Project report document

Zara Retail Analysis.pptx – Final presentation generated via Gamma

README.md – This documentation

📌 How to Run

Clone the repository

Install pandas (requirements included)

Run Jupyter notebooks for EDA

Execute SQL scripts to load and analyze the dataset

Open the Power BI .pbix file to explore interactive dashboards
