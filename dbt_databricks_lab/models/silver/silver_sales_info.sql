
with b_sales as (
    SELECT
        sales_id,
        product_sk,
        customer_sk,
        {{ multiply('unit_price', 'quantity') }} as calculated_gross_amount,
        gross_amount,
        payment_method
    FROM
        {{ ref('bronze_sales') }}
),
b_product as (
    SELECT
        product_sk,
        product_name,
        category
    FROM
        {{ ref('bronze_product') }}
),
b_customer as (
    SELECT
        customer_sk,
        gender
    FROM
        {{ ref('bronze_customer') }}
)
,
final as (
    SELECT
    b_sales.sales_id,
    b_sales.calculated_gross_amount,
    b_sales.payment_method,
    b_product.product_name,
    b_product.category,
    b_customer.gender
FROM
    b_sales
JOIN
    b_product
ON
    b_sales.product_sk = b_product.product_sk
JOIN
    b_customer
ON
    b_sales.customer_sk = b_customer.customer_sk    
)
select category,
    gender,
    sum(calculated_gross_amount) as total_sales
from final
group by category, gender
order by total_sales desc