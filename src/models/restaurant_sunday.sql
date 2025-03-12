with open_sunday as (
select * from {{source('dbt-ippon-training','RESTAURANTS' )}}

  where open_on_sunday = 1
)

select * from open_sunday