select 
    registration_year,
    count(*) as total_registered_evs
from
    {{ ref('ev_only_vehicle_register')}}
WHERE
    registration_year is not null
group by
    registration_year
order by
    registration_year