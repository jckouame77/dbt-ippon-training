with open_sunday as (
select * from {{source('dbt_ippon_training','RESTAURANTS' )}}

  where open_on_sunday = 1
)

select * from open_sunday