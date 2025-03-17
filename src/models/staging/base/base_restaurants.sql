with stg_restaurants as (
    select * from {{ source('dbt_ippon_training', 'RESTAURANTS') }}
)

select distinct * from stg_restaurants