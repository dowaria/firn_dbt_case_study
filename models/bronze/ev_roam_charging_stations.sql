select
    RAW_DATA:"OBJECTID"::string as station_id,
    RAW_DATA:"NAME"::string as station_name,
    RAW_DATA:"OPERATOR"::string as operator_name,
    RAW_DATA:"OWNER"::string as owner_name,
    RAW_DATA:"ADDRESS"::string as address,
    try_to_double(RAW_DATA:"latitude"::string) as latitude,
    try_to_double(RAW_DATA:"longitude"::string) as longitude,
    RAW_DATA:"hasChargingCost"::string as has_charging_cost,
    RAW_DATA:"is24Hours"::string as is_24_hours,
    RAW_DATA:"connectorsList"::string as connectors_list,
    RAW_DATA:"GlobalID"::string as global_id,
    try_to_date(RAW_DATA:"dateFirstOperational"::string, 'DD/MM/YYYY') as first_operational_date,
    try_to_number(RAW_DATA:"numberOfConnectors"::string) as number_of_connectors
from {{ source('staging_schema', 'EV_ROAM_CHARGING_STATIONS') }}