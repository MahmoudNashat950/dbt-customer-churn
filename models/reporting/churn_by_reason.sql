select
    churn_category,
    churn_reason,
    count(*) as churned_customers,
    round(
        count(*)::numeric * 100 / sum(count(*)) over (),
        2
    ) as churn_percentage
from {{ ref('fct_customer_churn') }}
where customer_status = 'Churned'
group by churn_category, churn_reason
order by churned_customers desc