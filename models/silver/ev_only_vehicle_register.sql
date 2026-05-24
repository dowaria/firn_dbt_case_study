select
    make,
    model,
    vehicle_type,
    motive_power,
    tla,
    registration_year,
    vehicle_year,
    body_type,
    vehicle_usage,
    width,
    height

from {{ ref('motor_vehicle_register') }}

where upper(motive_power) in (
    'ELECTRIC',
    'PLUGIN PETROL HYBRID',
    'PETROL ELECTRIC HYBRID',
    'ELECTRIC [PETROL EXTENDED]',
    'ELECTRIC FUEL CELL HYDROGEN'
)