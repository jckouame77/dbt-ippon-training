with stg_restaurants(
    select * from {{ source('dbt-ippon-training', 'RESTAURANTS') }}
)

select distinct * from stg_restaurants