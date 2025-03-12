select
    identifier
    , name
    , selling_price
    , production_cost
    , type
from 
   {{ source('dbt-ippon-training', 'DISHES') }}