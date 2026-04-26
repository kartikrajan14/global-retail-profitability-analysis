# Global Retail Profitability Analysis

##  Project Overview

This project performs an end-to-end **profitability analysis for a global retail business** to understand which regions, product categories, and customer segments drive revenue and profit — and where margin improvement opportunities exist.

The analysis spans **51,290 orders** across **5 global markets** (USCA, Europe, Asia Pacific, LATAM, and Africa) from **2012 to 2015**, converting raw sales data into **actionable business insights** for strategic decision-making.

---

##  Business Objectives

- Identify high and low profitability regions across global markets
- Analyze product category and sub-category performance
- Evaluate customer segment contribution to revenue and profit
- Detect loss-making products, discount patterns, and return trends
- Understand shipping mode efficiency and delivery performance
- Support data-driven pricing, inventory, and market expansion strategies

---

##  Tools & Technologies

| Tool | Purpose |
|------|---------|
| **Python** (Pandas, NumPy, Matplotlib, Seaborn, Scipy, Scikit-learn) | Data cleaning, EDA, A/B testing, and ML modeling |
| **PostgreSQL** | Business queries for profitability and segmentation analysis |
| **Power BI** | Interactive executive dashboard for insights and storytelling |
| **Tableau** | Visual analytics and profitability breakdown |
| **GitHub** | Version control and documentation |

---

##  Dataset Description

- **Source:** Global Superstore Retail Data
- **Period:** 2012 – 2015
- **Volume:** 51,290 order records

### Files

| File | Description |
|------|-------------|
| `orders_cleaned.csv` | Main transactional data — sales, profit, shipping, product, and customer details |
| `returns_cleaned.csv` | Returned orders with region mapping |
| `people_cleaned.csv` | Regional sales representatives |

### Key Columns in Orders

- `order_date`, `ship_date`, `delivery_days` — Order and shipping timeline
- `market`, `region`, `country`, `city` — Geographic hierarchy (5 markets)
- `category`, `sub_category`, `product_name` — Product hierarchy
- `segment` — Customer segments: Consumer, Corporate, Home Office
- `sales`, `profit`, `discount`, `shipping_cost` — Financial metrics
- `profit_margin` — Engineered feature (profit / sales)
- `ship_mode`, `order_priority` — Operational fields

---

##  Data Cleaning & Feature Engineering (Python)

Steps performed in the Jupyter notebook:

- Standardized column names (lowercase, underscores)
- Converted `order_date` and `ship_date` to datetime
- Handled missing values and encoding issues (`latin1`)
- Engineered new features:
  - `delivery_days` — Days between order and shipment
  - `profit_margin` — Ratio of profit to sales
  - `order_year`, `order_month`, `order_month_name` — Date decomposition

---

##  SQL Analysis (PostgreSQL)

Business queries written to answer key profitability questions:

| Query | Business Question |
|-------|------------------|
| Top 10 Selling Products | Which products drive the most revenue? |
| Total Sales by Region | Which regions are the strongest markets? |
| Total Profit by Category | Which categories are most profitable? |
| Monthly Sales Trend | How does revenue evolve over time? |
| Top Customers by Profit | Who are the most valuable customers? |
| Orders with Negative Profit | Where are we losing money? |
| Shipping Mode Analysis | Which shipping modes are efficient and profitable? |
| Sales vs. Profit by Segment | How do Consumer, Corporate, and Home Office compare? |

---

##  A/B Testing & Machine Learning (Python)

### A/B Testing — Discount Impact on Profit

A statistical hypothesis test was conducted to answer: **does offering a discount above 20% significantly hurt profit?**

- **Group A (Control):** Orders with discount ≤ 20%
- **Group B (Treatment):** Orders with discount > 20%
- **Test used:** Independent samples t-test (`scipy.stats.ttest_ind`)
- **Result:** p-value = 0.001 (< 0.05) → **statistically significant**
- **Conclusion:** High discounts (>20%) have a statistically proven negative impact on profit, providing quantitative backing for pricing strategy changes

### Machine Learning — Profit Prediction (Linear Regression)

A Linear Regression model was built to predict order-level profit using key business features:

| Feature | Impact on Profit |
|---------|-----------------|
| `sales` | +₹0.178 per unit of sales |
| `quantity` | -₹4.28 per additional unit |
| `discount` | **-₹226.66** per unit increase in discount rate |

- **Features used:** `sales`, `quantity`, `discount`
- **Train/test split:** 80% / 20%
- **Model Accuracy (R²):** 0.261
- **Mean Absolute Error:** ₹60.28
- **Key finding:** Discount is by far the most damaging feature to profit, reinforcing the A/B test conclusion

---

##  Key Metrics Analyzed

- Total Revenue & Total Profit
- Profit Margin (%)
- Revenue and Profit by Region and Market
- Profitability by Product Category and Sub-Category
- Customer Segment Contribution
- Discount Impact on Profit (A/B Test + ML)
- Shipping Mode Efficiency
- Return Rates by Region
- ML Profit Prediction (R², MAE)


---

##  Key Insights

- Certain regions generate high revenue but relatively low profit, indicating pricing or cost inefficiencies
- **Technology** and **Office Supplies** contribute most significantly to overall profitability; **Furniture** consistently underperforms on margins
- The **Consumer** segment drives the largest share of revenue, while **Home Office** shows the most margin volatility
- Certain sub-categories consistently operate at a loss — driven by aggressive discounting
- **A/B Test Result:** Orders with discount >20% show a statistically significant negative impact on profit (p-value < 0.0001)
- **ML Model Result:** Discount is the single most damaging driver of profit loss (-₹226 per unit increase), confirmed by Linear Regression
- **Standard Class** shipping dominates order volume, while **Same Day** shipping has the lowest order count but distinct profitability characteristics

---

##  Business Recommendations

- Re-evaluate pricing and discount strategies in low-margin regions and sub-categories
- Optimize or discontinue consistently loss-making product lines
- Focus expansion and marketing investment on high-profit regions and customer segments
- Use delivery-day data to identify shipping inefficiencies and reduce costs
- Investigate return patterns by region to reduce return-driven revenue leakage
- Leverage high-performing sales representatives' strategies across underperforming regions

---

##  Project Structure

```
global-retail-profitability-analysis/
│
├── data/
│   ├── orders_cleaned.csv
│   ├── returns_cleaned.csv
│   └── people_cleaned.csv
│
├── python/
│   └── GLOBAL_RETAIL_PROJECT.ipynb
│
├── sql/
│   └── global_superstore_analysis_postgres.sql
│
├── powerbi/
│   └── Global_Retail_Analytics.pbix
│
├── tableau/
│   └── Global_Retail_Profitability_Analysis.twb
│
├── screenshots/
│   ├── powerbi_dashboard.png
│   └── tableau_dashboard.png
│
└── README.md
```

---

##  How to Run This Project

1. **Clone the repository**
   ```bash
   git clone https://github.com/kartikrajan14/global-retail-profitability-analysis.git
   ```

2. **Python EDA**
   - Open `python/GLOBAL_RETAIL_PROJECT.ipynb` in Jupyter Notebook or VS Code
   - Ensure `pandas`, `numpy`, `matplotlib`, and `seaborn` are installed
   - Run all cells to reproduce the cleaning and analysis

3. **SQL Analysis**
   - Load the cleaned `orders_cleaned.csv` into a PostgreSQL database as the `Orders` table
   - Execute queries from `sql/global_superstore_analysis_postgres.sql`

4. **Power BI Dashboard**
   - Open `powerbi/Global_Retail_Analytics.pbix` in Power BI Desktop
   - Refresh the data source to point to your local CSV files

5. **Tableau Dashboard**
   - Open `tableau/Global_Retail_Profitability_Analysis.twb` in Tableau Desktop
   - Update the data source connection if prompted

---

##  Outcome

This project demonstrates **end-to-end, business-focused analytics skills** — from raw data cleaning in Python and structured querying in SQL, to executive-level storytelling via Power BI and Tableau dashboards. The result is a set of **profitability insights and strategic recommendations** aligned with real-world global retail decision-making.

---

*Analysis by **Kartikay Rajan***
