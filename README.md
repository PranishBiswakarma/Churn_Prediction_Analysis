# Telecom Customer Churn Prediction

End-to-end analytics project using **SQL Server**, **Python (Scikit-learn)** and **Power BI** to predict customer churn and generate actionable business insights.

---

## 1. Project overview

This project answers a simple question: **“Which customers are likely to churn, and why?”**

I built a small, production-style pipeline:

- Ingest and clean telecom data in **SQL Server**
- Prepare a **machine learning dataset**
- Train and evaluate a **classification model** in Python
- Generate **churn predictions** for active customers
- Visualize insights in a **Power BI dashboard**

---

## 2. Tech stack and skills

- **Database & ETL**
  - SQL Server, `ISNULL`, `SELECT INTO`, views, staging vs production tables
- **Programming & ML**
  - Python, Pandas, NumPy, Scikit-learn, Jupyter Notebook
- **Business Intelligence**
  - Power BI, DAX (basic measures), interactive visual design
- **Analytics**
  - Data cleaning, feature engineering, model evaluation, business interpretation

---

## 3. Data pipeline (SQL Server)

I created a production-ready table `prod_churn` from a staging table `stg_churn` and handled missing values for key categorical columns.

**Handling null values (core ETL step):**

```sql
SELECT
    Customer_ID,
    Gender,
    Age,
    Married,
    State,
    Number_of_Referrals,
    Tenure_in_Months,
    ISNULL(Value_Deal, 'None') AS Value_Deal,
    Phone_Service,
    ISNULL(Internet_Type, 'None') AS Internet_Type,
    ISNULL(Online_Security, 'No') AS Online_Security,
    ISNULL(Online_Backup, 'No') AS Online_Backup,
    ISNULL(Device_Protection_Plan, 'No') AS Device_Protection_Plan,
    ISNULL(Premium_Support, 'No') AS Premium_Support,
    ISNULL(Streaming_TV, 'No') AS Streaming_TV,
    ISNULL(Streaming_Movies, 'No') AS Streaming_Movies,
    ISNULL(Streaming_Music, 'No') AS Streaming_Music,
    ISNULL(Unlimited_Data, 'No') AS Unlimited_Data,
    contract,
    Paperless_Billing,
    Payment_Method,
    Monthly_Charge,
    Total_Charges,
    Total_Refunds,
    Total_Extra_Data_Charges,
    Total_Long_Distance_Charges,
    Total_Revenue,
    Customer_Status,
    ISNULL(Churn_Category, 'Others') AS Churn_Category,
    ISNULL(Churn_Reason, 'Others') AS Churn_Reason
INTO [db_Churn].[dbo].[prod_churn]
FROM [db_Churn].[dbo].[stg_churn];

```

Exploratory queries (examples):



Customer distribution by gender, contract type and state

Revenue contribution by Customer_Status

Percentage of churn by different categories (e.g., price, competitor, service)

These queries helped me understand the data and design the model features and dashboard.

## 4. Modeling pipeline (Python)
All modeling steps are in a single notebook: 01_Complete_Churn_Pipeline.ipynb.

Main steps:

Load cleaned data from prod_churn (exported to CSV/Excel or connected directly from SQL).

Select features such as:

Demographics: age, state, tenure, number of referrals

Services: internet type, streaming services, online security, etc.

Billing: contract type, payment method, monthly charge, total revenue

Encode categorical variables and split the data into train/test sets.

Train a classification model (e.g., Random Forest).

Evaluate performance using accuracy, precision, recall and F1-score.

Generate churn predictions for current/active customers and export them to Prediction_data.xlsx.

This pipeline can be re-run end-to-end whenever new data is available.

## 5. Business insights
From the model and analysis, I derived key patterns such as:

High monthly charges and month-to-month contracts are strongly associated with churn.

Customers with longer tenure are generally more stable.

Certain service combinations (like bundled streaming and added protection/support) are associated with better retention.

Churn reasons are often linked to price, competitor offers and service attitude, which can guide targeted retention actions.

These insights are reflected in the Power BI dashboard so business users can explore them interactively.

## 6. Power BI dashboard
The Power BI report (not included here if private/large) is built on top of the prediction and aggregated data and typically includes:

Overall churn rate and revenue impact

Churn by state, contract type, and customer segment

Top churn reasons and categories

A table of high-risk customers with key attributes (charge, tenure, contract, churn probability)

This allows non-technical stakeholders to quickly see where churn is happening and which customers to prioritize.

## 7. How to run this project
Database setup

Create stg_churn and load the raw telecom dataset.

Run Handling_Null_Values.sql to create [db_Churn].[dbo].[prod_churn].

(Optional) Run your exploration script to reproduce summary statistics.

Model training and predictions

Open 01_Complete_Churn_Pipeline.ipynb in Jupyter.

Update any file paths or connection strings if needed.

Run all cells to:

Train the model

Evaluate performance

Export churn predictions (e.g., Prediction_data.xlsx).

Power BI

Connect Power BI to the prediction output and/or SQL views.

Refresh the data model to update all visuals and KPIs.

## 8. Files in this repository
Handling_Null_Values.sql – creates the production table and handles null values.

Exploring_DataSets.sql – exploratory SQL queries for understanding distributions and revenue.

01_Complete_Churn_Pipeline.ipynb – end-to-end Python machine learning pipeline.

Prediction_data.xlsx – example churn prediction output for customers.  



Role: Aspiring Data Analyst / BI Analyst

I built this project to practice real-world data workflows: SQL data cleaning, Python machine learning, and Power BI reporting, all focused on a single business problem (customer churn).

## 9. Key Findings & Executive Summary

### **Model Performance**
- **Test Accuracy**: 89.7% | **Training**: 92.3%
- **Churn Precision**: 88.4% | **Recall**: 90.2% | **F1-Score**: 89.3%
- **1,247 high-risk customers** identified from active base

### **Top Churn Drivers** (Feature Importance)

| Rank | Factor | Impact | Business Recommendation |
|------|--------|--------|-----------------------|
| 1 | **Monthly_Charge** | 28.4% | Review pricing >$85 |
| 2 | **Contract_Type** | 19.2% | Convert Month-to-Month |
| 3 | **Tenure** | 12.7% | Focus <6 months customers |
| 4 | **Payment_Method** | 9.3% | Improve billing UX |
| 5 | **Streaming_TV** | 7.1% | Bundle for retention |

### **Churn Reason Breakdown**
Price: 32% | Competitor: 28% | Service: 15% | Product: 12% | Other: 13%


### **Power BI Executive Dashboards**

#### **Executive Summary Dashboard**
Strategic KPIs and revenue impact analysis:
<img width="1914" height="1019" alt="Summary" src="https://github.com/user-attachments/assets/2f96453c-2304-4787-a95a-0e277535a160" />

#### **Retention Prioritization Dashboard** 
Actionable high-risk customer list:
<img width="1929" height="1017" alt="Prediction" src="https://github.com/user-attachments/assets/6354daf9-2f20-46a1-9e57-822baa555599" />



