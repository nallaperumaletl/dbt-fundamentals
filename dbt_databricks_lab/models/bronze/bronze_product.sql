select
*
from
{{ source('landing', 'dim_product') }}