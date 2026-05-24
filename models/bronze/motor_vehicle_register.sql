select
    "MAKE" as make,
    "MODEL" as model,
    "VEHICLE_TYPE" as vehicle_type,
    "MOTIVE_POWER" as motive_power,
    "TLA" as tla,
    try_to_number("FIRST_NZ_REGISTRATION_YEAR") as registration_year,
    try_to_number("VEHICLE_YEAR") as vehicle_year,
    "BODY_TYPE" as body_type,
    "VEHICLE_USAGE" as vehicle_usage,
    "BASIC_COLOUR" as colour,
    try_to_number("WIDTH") as width,
    try_to_number("HEIGHT") as height

from {{ source('staging_schema', 'MOTOR_VEHICLE_REGISTER') }}