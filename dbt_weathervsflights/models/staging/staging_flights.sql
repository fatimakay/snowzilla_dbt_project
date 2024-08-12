with flights_cleaned AS(
    SELECT flight_date::DATE
            ,TO_CHAR(dep_time, 'fm0000')::TIME AS dep_time
            ,TO_CHAR(sched_dep_time, 'fm0000')::TIME AS sched_dep_time
            ,dep_delay
            ,TO_CHAR(arr_time, 'fm0000')::TIME AS arr_time
            ,TO_CHAR(sched_arr_time, 'fm0000')::TIME AS sched_arr_time
            ,arr_delay
            ,airline
            ,tail_number
            ,flight_number
            ,origin
            ,dest
            ,actual_elapsed_time
            ,(actual_elapsed_time * '1 minute'::INTERVAL) AS actual_elapsed_time_interval
            ,cancelled
            ,diverted
    FROM {{source('staging_flights', 'flights')}}
)
SELECT * FROM flights_cleaned