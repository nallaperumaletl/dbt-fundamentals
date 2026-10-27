select
*
from
{{ source('landing', 'dim_date') }}