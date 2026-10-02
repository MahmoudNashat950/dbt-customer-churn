select
    customer_id,
    city,
    zip_code,
    zip_population,
    age,
    tenure_months,
    contract,
    internet_type,
    payment_method,
    monthly_charge,
    total_revenue,
    churn_category,
    churn_reason
from {{ ref('fct_customer_churn') }}
where customer_status = 'Churned'