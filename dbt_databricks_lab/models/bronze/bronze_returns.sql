select 
* from 
{{ source('landing', 'fact_returns') }}