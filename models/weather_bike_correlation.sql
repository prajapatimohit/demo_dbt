WITH CTE AS (
    Select 
    t.*,
    w.*
    From 
    {{ ref('trip_fact') }} t
    left join
    {{ ref('daily_weather') }} w
    On t.TRIP_DATE = w.daily_weather
)

Select 
* 
from 
CTE