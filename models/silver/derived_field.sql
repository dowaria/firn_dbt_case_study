select
    station_id,
    value as connector_details

from dbt_firn.ev_roam_charging_stations,
lateral split_to_table(connectors_list, '},{')

