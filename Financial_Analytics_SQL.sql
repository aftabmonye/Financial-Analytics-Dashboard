select * from financial_data;

-- 1	Total Net Revenue, Total Expense, Total Profit, and Profit Margin

select
round(sum(Net_Revenue),2) as Total_Revenue,
round(sum(Total_Expense),2) as Total_Expense,
round(sum(Profit),2) as Total_Profit,
round((sum(Profit) / SUM(Net_Revenue)) * 100, 2) AS Profit_Margin_Percentage
FROM financial_data;

-- 2	Monthly revenue and profit trend

select
	  Year,
      Month,
      round(sum(Net_Revenue),2) Monthly_Revenue,
      round(sum(Profit),2) Monthly_Profit
from financial_data
group by Year, Month
order by Year, Month;

-- 3	Top 5 products by revenue

select 
	  Product, 
      round(sum(Net_Revenue),2) Total_Revenue
from financial_data
group by Product
order by Total_Revenue desc
limit 5;

-- 4	Profit by UAE region

select
     Region,
     round(sum(Profit),2) Total_Profit
from financial_data
group by Region
order by Total_Profit desc;

-- 5	Customer segment wise revenue and profit

select
	 Customer_Segment,
	  round(sum(Net_Revenue),2) Total_Revenue,
      round(sum(Profit),2) Total_Profit
from financial_data
group by Customer_Segment
order by Total_Profit desc;

-- 6	Payment status count and overdue revenue

select
	 Payment_Status,
     count(*) Total_Transaction,
     ROUND(SUM(Net_Revenue), 2) AS Total_Revenue
from financial_data
group by Payment_Status
order by Total_Revenue desc;

-- 6.1 Only Overdue status

select
	Payment_Status,
    round(sum(Net_Revenue),2) Total_Revenue
from financial_data
where Payment_Status = 'overdue';

-- 7	Budget vs actual revenue and variance by month

select
	Year,
    Month,
    round(sum(Budget_Target), 2)  Budget_Revenue,
    round(sum(Net_Revenue), 2)  Actual_Revenue,
    round(sum(Net_Revenue)- sum(Budget_Target), 2) Variance
from financial_data
group by Year, Month
order by Year, Month;

-- 8	Department wise expense and profit

select
	 Department,
     round(sum(Total_Expense), 2) Total_Expense,
     round(sum(Profit), 2) Total_Profit
from financial_data
group by Department
order by Total_Profit desc;

-- 9	Quarter wise revenue growth

select
    Year,
    Quarter,
    round(sum(Net_Revenue), 2) Total_Revenue
from financial_data
group by Year, Quarter
order by Year, Quarter;

-- 10	Find high revenue but low profit margin products

select
    Product,
    round(sum(Net_Revenue), 2)  Total_revenue,
    round(sum(Profit), 2)  Total_profit,
    round((sum(Profit) / sum(Net_Revenue)) * 100, 2)  Profit_Margin_Percentage
from financial_data
group by Product
order by Profit_Margin_Percentage asc;
