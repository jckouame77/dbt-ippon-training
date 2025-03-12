with stg_orders as (

 select  RESTAURANT_IDENTIFIER 
                , SUM(AMOUNT) as turnover
        from {{ source('dbt-ippon-training', 'ORDERS') }}
        group by   RESTAURANT_IDENTIFIER
),

stg_restaurants as ( select IDENTIFIER, NAME, address
        from {{ source('dbt-ippon-training', 'RESTAURANTS') }}

)

select a.RESTAURANT_IDENTIFIER, b.name  , b.address , a.turnover
from  stg_orders a  
left join stg_restaurants b ON a.RESTAURANT_IDENTIFIER= b.IDENTIFIER