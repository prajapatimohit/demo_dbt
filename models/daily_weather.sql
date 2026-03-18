With daily_weather AS (

Select 
date(time) as daily_weather,
weather,
temp,
pressure,
humidity,
clouds


from {{ source('demo', 'weather') }} 

),

daily_weather_aggregate as (
    select 
    daily_weather,
    weather,
    -- count(weather),
    -- row_number() over(Partition by daily_weather  order by count(weather) desc) as row_num
   ROUND(avg(temp),2) as avg_temp,
   ROUND(avg(pressure),2) as avg_pressure,
   ROUND(avg(humidity),2) as avg_humidity,
   ROUND(avg(clouds),2) as avg_clouds
from daily_weather
group by
daily_weather,
weather
Qualify row_number() over(Partition by daily_weather  order by count(weather) desc) = 1
)

Select * from  daily_weather_aggregate
