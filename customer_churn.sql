create database churn_analysis;
use churn_analysis;

select count(*) as Total_customers
from customer_churn; 

-- churned customers
select count(*) as Total_customers
from customer_churn
where churn = "Yes";

-- churn rate(%)
select 
    round(avg(churn_flag) * 100, 2) as churn_rate
    from customer_churn;
    
-- Active customers
select count(*) as   active_customers
from customer_churn
where churn = 'No';   
    
-- Average monthly charges
select 
round( avg(monthly_charges), 2) as average_monthly_charges    
from customer_churn;

 -- Total Revenue ( Till Date )
select
round(sum(total_charges), 2) as total_revenue
from customer_churn;
 
-- Revenue at Risk
select  
    sum(monthly_charges) as revenue_at_risk    
    from customer_churn;

--  churn rate by contract type
select 
  contract, 
  round(avg(churn_flag) * 100, 2) as churn_rate_pct
  from customer_churn
  group by contract
  order by churn_rate_pct desc;
    
-- churn rate by tenure group    
select
    tenure_group,
    round(avg(churn_flag) * 100, 2) as tenure_rate_pct
    from customer_churn
    group by tenure_group
    order by tenure_rate_pct;
    
-- Average Tenure( Churned vs Active )
select
     churn,
     round( avg(tenure) ,1) as avg_tenure_months
     from customer_churn
     group by churn;
         
-- High-Value customers(Top 20% by Revenue)
select * from customer_churn
order by total_charges desc
limit 20;

-- customer with high charges & low tenure( High Risk )
select count(*) as high_risk_customers
from customer_churn 
where tenure < 12
and monthly_charges > (
select avg(monthly_charges)
from customer_churn
);

-- churn count by payment method

    select 
        payment_method,
        count(*) as churned_customers
        from customer_churn
        where churn = 'Yes'
        group by payment_method
        order by churned_customers desc;
    
    


         
         
         
 
 
 
 
 
 