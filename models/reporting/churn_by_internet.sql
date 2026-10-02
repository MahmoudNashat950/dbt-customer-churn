select
    internet_type,
    count(*) as total_customers,
    count(*) filter (where customer_status = 'Churned') as churned_customers,
    round(
        count(*) filter (where customer_status = 'Churned')::numeric
        * 100 / count(*),
        2
    ) as churn_rate
from {{ ref('fct_customer_churn') }}
group by internet_type
order by churn_rate desc