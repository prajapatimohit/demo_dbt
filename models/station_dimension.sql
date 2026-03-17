With bike as (
select
DISTINCT
START_STATIO_ID AS STATION_ID,
START_STATION_NAME AS STATION_NAME,
START_LAT,
START_LNG


From {{ source('demo', 'bike') }}
where RIDE_ID != 'ride_id'


)
Select * from bike