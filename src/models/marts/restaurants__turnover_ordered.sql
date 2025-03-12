


with stg_data as (
select * from {{ ref('stg_restaurants__turnover')}}  limit {{var('nb_restaurants_to_show')}}

)

select * from stg_data order by turnover desc 