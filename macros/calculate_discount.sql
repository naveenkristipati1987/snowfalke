{% macro calculate_discount(price, discount) %}
  ({{ price }} * (1 - {{ discount }}))
{% endmacro %}