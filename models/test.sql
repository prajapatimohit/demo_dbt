select 
* 
from {{ source('demo', 'bike') }}

Limit 10