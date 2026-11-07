# Netflix Customer Churn & Revenue Analytics

## Project Overview

This project focuses on analyzing customer churn and revenue patterns in a Netflix-style subscription business.

The main objective is to identify customers who are likely to cancel their subscriptions, understand customer behaviour, analyze revenue exposure, and generate actionable business insights.

This project uses Python, SQL, Machine Learning, and Power BI to analyze customer subscription data and predict churn risk.

## Project Objectives

- Analyze customer churn patterns.
- Identify high-risk customer segments.
- Understand customer engagement and subscription behaviour.
- Analyze monthly recurring revenue (MRR).
- Predict customer churn using Machine Learning.
- Build an interactive Power BI dashboard.


## Dataset Description

This project uses a synthetic Netflix-style customer churn dataset containing 5,000 customer records from Kaggle.

The dataset includes customer demographics, subscription details, viewing behaviour, payment information, and churn status.

### Dataset Details

- Total Records: 5,000
- Original Columns: 14
- Data Format: CSV
- Dataset Type: Synthetic Data

### Important Columns

| Column | Description |
|---|---|
| customer_id | Unique customer ID |
| age | Customer age |
| gender | Customer gender |
| subscription_type | Subscription plan |
| watch_hours | Total viewing hours |
| last_login_days | Days since last login |
| region | Customer region |
| device | Device used |
| monthly_fee | Monthly subscription fee |
| churned | Customer churn status |
| payment_method | Customer payment method |
| number_of_profiles | Number of profiles |
| avg_watch_time_per_day | Average daily viewing time |
| favorite_genre | Favourite content genre |

**Note:** The dataset is synthetic and is used only for educational and portfolio purposes.


## Technologies Used

| Technology | Purpose |
|---|---|
| Python | Data cleaning, analysis and machine learning |
| Pandas | Data manipulation and preprocessing |
| NumPy | Numerical operations |
| Matplotlib | Data visualization |
| Seaborn | Statistical visualization |
| Scikit-learn | Machine learning model development |
| MySQL | Database management and SQL analysis |
| Power BI | Interactive dashboard development |
| Jupyter Notebook | Python development and analysis |
| Git & GitHub | Version control and project sharing |

## Project Tools

- Python
- Jupyter Notebook
- MySQL Workbench
- Microsoft Power BI
- Visual Studio Code
- GitHub


## Project Workflow

The project follows these major steps:

### 1. Data Loading
- Load the customer churn dataset using Python.
- Understand the dataset structure and columns.

### 2. Data Cleaning
- Check missing values.
- Identify duplicate customer records.
- Validate data types.
- Check invalid or inconsistent values.
- Prepare the cleaned dataset.

### 3. Exploratory Data Analysis (EDA)
- Analyze customer demographics.
- Explore subscription types.
- Understand customer viewing behaviour.
- Analyze churn distribution.
- Identify important churn patterns.

### 4. Feature Engineering
- Create customer age groups.
- Categorize login recency.
- Create customer engagement bands.
- Prepare features for machine learning.

### 5. SQL Analysis
- Store customer data in MySQL.
- Calculate overall churn rate.
- Analyze churn by subscription type.
- Analyze churn by region and device.
- Identify high-risk customer segments.
- Analyze monthly recurring revenue.

### 6. Machine Learning
- Prepare features and target variables.
- Split data into training and testing sets.
- Train classification models.
- Compare model performance.
- Select the best-performing model.

### 7. Model Evaluation
- Accuracy
- Precision
- Recall
- F1-score
- ROC-AUC
- Confusion Matrix

### 8. Customer Risk Scoring
- Calculate customer churn probabilities.
- Categorize customers into Low, Medium and High risk.
- Estimate potential monthly revenue exposure.

### 9. Power BI Dashboard
- Build an interactive customer churn dashboard.
- Analyze customer retention and revenue.
- Visualize customer risk distribution.
- Present machine learning insights.


## Machine Learning Models

The project explores supervised machine learning classification algorithms to predict customer churn.

### Models Used

- Random Forest Classifier
- Gradient Boosting Classifier
- HistGradientBoosting Classifier

### Model Evaluation Metrics

The models are evaluated using:

- Accuracy
- Precision
- Recall
- F1-score
- ROC-AUC
- PR-AUC
- Confusion Matrix

### Initial Model Results

| Metric | Score |
|---|---:|
| Accuracy | 99.50% |
| Precision | 99.40% |
| Recall | 99.60% |
| F1-score | 99.50% |

**Note:** These are initial results from a synthetic dataset. Further validation for data leakage and synthetic patterns is required before interpreting the model's performance as representative of real-world data.


## Power BI Dashboard

An interactive Power BI dashboard was developed to analyze customer churn, subscription performance, and revenue exposure.

### Page 1: Customer Churn & Revenue Overview

Key metrics:
- Total Customers
- Churn Rate
- MRR Churn Percentage
- Expected Revenue at Risk
- High Risk Customers
- Total Monthly Recurring Revenue (MRR)

Visualizations:
- Churn Rate by Login Recency
- Churn Rate by Subscription Type
- Retained vs Churned MRR
- Churn Rate by Engagement Level
- Customers by Risk Tier
- Churn Rate by Region
- Customer Churn by Device and Subscription Type

### Page 2: Churn Prediction & ML Insights

Key metrics:
- Model Accuracy
- Precision
- Recall
- F1-score
- Predicted Churners

Visualizations:
- Customer Engagement vs Login Recency
- Feature Importance
- Churn Probability Distribution
- Confusion Matrix
- Customer Risk and Revenue Exposure Details

### Dashboard Interactivity

The dashboard includes slicers for:
- Subscription Type
- Region
- Device

These slicers allow users to explore customer churn patterns across different segments.


## Business Insights & Recommendations

The project aims to identify important customer churn patterns and support data-driven retention decisions.

### Key Areas of Analysis

- Identify subscription plans with higher customer churn.
- Understand the relationship between login recency and churn.
- Analyze customer engagement and viewing behaviour.
- Identify regions and devices associated with higher churn.
- Identify customers with high predicted churn probabilities.
- Estimate potential monthly revenue exposure.

### Business Recommendations

1. **Customer Retention:** Develop targeted retention campaigns for high-risk customers.
2. **Customer Engagement:** Encourage inactive customers to return through personalized content recommendations.
3. **Subscription Strategy:** Review plans with higher churn rates.
4. **Revenue Protection:** Prioritize customers with high churn probability and higher monthly fees.
5. **Customer Experience:** Use engagement patterns to identify opportunities to improve customer satisfaction.

*Note: Final business insights and recommendations should be confirmed using the completed analysis results.*

### Dashboard Preview

#### Customer Churn & Revenue Overview

![Netflix Customer Churn Dashboard](<./powerbi/Executive Summary.png>)

#### Churn Prediction & ML Insights

![Churn Prediction and ML Insights Dashboard](<./powerbi/Churn_Predictions.png>)


## Project Folder Structure

```text
Netflix_customer/
│
├── notebooks/
│   └── 01_validate.ipynb
│
├── powerbi/
│   ├── churn_scored.csv
│   ├── feature_importance.csv
│   ├── test_predictions.csv
│   └── Netflix_Churn.pbix
│
├── sql/
│   ├── Netflix_churn analysis.sql
│   └── netflix_churn-views.sql
│
├── reports/
│
├── .env.example
├── .gitignore
└── README.md
```

## Author

**ARTHI S**

Aspiring Data Analyst

**Technical Skills:**
- Python
- SQL
- Power BI
- Excel
- Machine Learning
- Data Analytics

**GitHub:**  https://github.com/arthisenthilkumar
**LinkedIn:** www.linkedin.com/in/arthi-aws


## Disclaimer

This project uses synthetic Netflix-style customer data for educational and portfolio purposes only.

This project is not affiliated with or endorsed by Netflix. The analysis and machine learning results do not represent actual Netflix customers or business performance.

The project includes data analysis, SQL queries, machine learning experiments, and interactive Power BI dashboards. Further validation and documentation improvements are ongoing.