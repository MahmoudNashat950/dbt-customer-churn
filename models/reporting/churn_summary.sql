select
    customer_status,
    count(*) as customer_count,
    round(
        count(*) * 100.0 / sum(count(*)) over (),
        2
    ) as customer_percentage,
   round(avg(monthly_charge)::numeric, 2) as avg_monthly_charge,
round(avg(total_revenue)::numeric, 2) as avg_total_revenue
from {{ ref('fct_customer_churn') }}
group by customer_status