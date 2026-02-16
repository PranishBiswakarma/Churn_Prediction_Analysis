Select Gender, Count(Gender) as TotalCount,
Count(Gender) * 100.0 / (select Count(*) from stg_churn) as Percentage
From stg_churn
Group By Gender

select Contract, count(Contract) as TotalCount, 
count(Contract) * 100.0 / (select count(*) from stg_churn) as Percentage
from stg_churn
group by Contract

select Customer_Status, count(Customer_Status) as TotalCount, Sum(Total_Revenue) as TotalRev,
sum(Total_Revenue) / (select sum(Total_Revenue) from stg_churn) * 100 as RevPercentage 
from stg_churn
group by Customer_Status

select State, count(State) as Totalcount,
count(State) * 100.0 / (select count(*) from stg_churn) as percentage
from stg_churn
group by State
order by percentage desc

