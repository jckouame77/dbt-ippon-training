{{ config(
        materialized= 'incremental',
        unique_keys= ['identifier' ,'Hour'],
        incremental_strategy='merge',
        tmp_relation_type='table',
        merge_exclude_columns=['identifier', 'Hour','job_insert_at_utc' ]


)}}


select 
    d.identifier                                           as identifier
    , d.name as name
    , date_trunc('hour',to_timestamp(odf.created_at))      as hour
    , count(*)                                             as nb_ordered
    , sum(d.selling_price)                                 as global_turnover
    , sum(d.selling_price - d.production_cost )             as global_profit
    , {{add_technical_columns()}}
from 
    {{ ref('stg_orders__dishes_flattened') }} as odf
left join 
    {{ ref('base_dishes') }} as d
        on odf.dishes_id = d.identifier
        {% if is_incremental() %}
WHERE odf.created_at >= (select max(Hour) from {{this}})
       {% endif %}

group by 1,2,3