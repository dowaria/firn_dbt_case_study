SELECT
    YEAR(try_to_date(first_operational_date)) AS STATION_YEAR,
    COUNT(DISTINCT STATION_ID) AS TOTAL_CHARGING_STATIONS,
    SUM(number_of_connectors) AS TOTAL_CONNECTOR
FROM {{ ref('ev_roam_charging_stations') }}
WHERE
    first_operational_date IS NOT NULL
GROUP BY
    YEAR(try_to_date(first_operational_date))
Order by 
    Station_year