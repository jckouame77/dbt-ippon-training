with stg_data as (
select * from {{ref('stg__seed_restaurants' )}}

)

select sum (nb_employees) as nb_employees from stg_data