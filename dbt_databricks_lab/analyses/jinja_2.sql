{#  Example 1 #}

{%- for i in range(11) -%}
  {{ i }}
{% endfor %}

{# Example 2 #}

{%- set apples = ["Gala", "Fuji", "Honeycrisp", "Granny Smith", "Red Delicious"] -%}
{% for i in apples -%}
    {% if i != "Fuji" %}
        {{ i }}
    {% else %}
        I hate {{ i }}
    {% endif %}
{% endfor %}