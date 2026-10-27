select 
*
from 
{{ source('landing', 'dim_customer') }}