select
    c.customer_id,
    c.gender,
    c.age,
    c.married,
    c.number_of_dependents,
    c.city,
    c.zip_code,
    z.population as zip_population,
    c.tenure_months,
    c.internet_service,
    c.internet_type,
    c.contract,
    c.payment_method,
    c.monthly_charge,
    c.total_charges,
    c.total_revenue,
    c.customer_status,
    c.churn_category,
    c.churn_reason
from {{ ref('stg_customer_churn') }} c
left join {{ ref('stg_zipcode_population') }} z
    on c.zip_code = z.zip_code