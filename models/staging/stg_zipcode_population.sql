select
    "Zip Code" as zip_code,
    "Population" as population
from {{ ref('telecom_zipcode_population') }}