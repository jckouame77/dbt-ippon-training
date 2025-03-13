{%macro mockable_source(source_table, table_name) %}
{%if target.name == 'Production' %}
    {{source(source_table, table_name) }}
  {% else %}  
  {{ ref("sample_"~table_name.lower())}}
  {% endif %}

{% endmacro %}