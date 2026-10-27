SELECT 
*
FROM
{{ source('landing', 'fact_sales') }}