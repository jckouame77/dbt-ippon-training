--{% set payment_methods = payment_methods_list() %}

{% set payment_methods = dbt_utils.get_column_values(table=source('dbt-ippon-training', 'ORDERS') , column='payment_method') %}




select
    restaurant_identifier,
    {% for payment_method in payment_methods %}
        sum(
            case when payment_method = '{{payment_method}}' then amount end
        ) as {{ payment_method }}_amount
        {% if not loop.last %}, {% endif %}
    {% endfor %}
from {{ ref("base_orders") }}
group by restaurant_identifier
