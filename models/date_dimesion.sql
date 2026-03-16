WITH CTE as (

Select

To_timestamp(STARTED_AT) as STARTED_AT,
DATE(to_timestamp(STARTED_AT)) as DATE_STARTED_AT,
hour(to_timestamp(STARTED_AT)) as HOUR_STARTED_AT,
CASE
    WHEN dayname(To_timestamp(STARTED_AT)) in ('Sat','Sun')
    THEN 'WEEKEND' ELSE 'WEEEKDAYS' END 
as DAY_TYPE,
CASE
    WHEN MONTH(To_timestamp(STARTED_AT)) in (12,1,2) THEN 'WINTER' 
    WHEN MONTH(To_timestamp(STARTED_AT)) in (3,4,5) THEN 'SPRING'
    WHEN MONTH(To_timestamp(STARTED_AT)) in (6,7,8) THEN 'SUMMER' 
    ELSE 'AUTUMN' END 
as STATIONOF_YEAR
from 
{{ source('demo', 'bike')}}
where STARTED_AT != 'started_at'

)

Select * from CTE

