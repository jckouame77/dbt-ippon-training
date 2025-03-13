with stg_restaurants as (
    select * from {{ source('dbt-ippon-training', 'RESTAURANTS') }}
)

select distinct * from stg_restaurants