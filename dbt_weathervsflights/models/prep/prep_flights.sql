select flight_date as date,
sched_dep_time, 
dep_time as actual_dep_time, 
dep_delay, 
sched_arr_time,
arr_time as actual_arr_time, 
arr_delay,
airline,
tail_number,
flight_number,
airport_code,
dest,
actual_elapsed_time,
actual_elapsed_time_interval,
cancelled,
diverted,
avg_temp_c,
min_temp_c,
max_temp_c,
precipitation_mm,
max_snow_mm,
avg_wind_direction,
avg_wind_speed_kmh,
wind_peakgust_kmh,
avg_pressure_hpa
from {{ref('staging_weather_daily')}} w
inner join {{ref('staging_flights')}} f 
on f.flight_date = w.date
and f.origin = w.airport_code 
