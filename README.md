# Customer Purchase Behavior Analysis
## Overview
This SQL script analyzes customer purchasing behavior using the AdventureWorks (SalesLT) database. It identifies high-value customers, calculates key retail metrics, and segments profiles based on spending habits and product preferences.

## Key Metrics Calculated
- Total Spent:Cumulative revenue generated per customer (filtered for completed orders, Status = 5).
- High-Value Orders Percentage:The proportion of a customer's individual orders where the subtotal exceeded $2,000.
- Total Orders Count:The absolute number of unique orders placed by each customer.
- Last Order Year:Extracts the year of the customer's most recent transaction to monitor engagement.
- Favorite Category:Evaluates spending to classify whether the customer primarily purchases 'Bikes' (SKUs starting with 'BK-') or 'Other' products.

## Target Audience Filtering
To isolate top-tier accounts for targeted marketing or VIP programs, the final output filters for power users who meet the following criterion:
- **Total Spent > $5,000**

Results are ordered in descending order by total expenditure to highlight the most valuable customers first.
## Structure
The query utilizes Common Table Expressions (CTEs) for optimal readability and performance:
1. FilteredSales:  Filters active, completed orders and joins header, detail, and product tables.
2. CustomerAggregates:  Aggregates metrics at the unique customer level and applies conditional logic for category preferences.
3. Main Select:  Evaluates threshold criteria and formats final outputs.
