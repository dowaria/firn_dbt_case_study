{{ config(materialized="table") }}

with
    ev_roam_charging_stations_transformed as (
        select distinct * from {{ ref("ev_roam_charging_stations") }}
    ),

    connector_list_exploded as (
        select
            station_id,
            station_name,
            operator_name,
            owner_name,
            address,
            latitude,
            longitude,
            has_charging_cost,
            is_24_hours,
            global_id,
            first_operational_date,
            number_of_connectors,

            replace(replace(value, '{', ''), '}', '') as connector_details

        from
            ev_roam_charging_stations_transformed,
            lateral split_to_table(connectors_list, '},{')
    ),
    connector_split as (
        select
            station_id,
            station_name,
            operator_name,
            owner_name,
            address,
            latitude,
            longitude,
            has_charging_cost,
            case
                when has_charging_cost = 'TRUE' then 'Paid' else 'Free'
            end as charing_cost,
            is_24_hours,
            global_id,
            first_operational_date,
            number_of_connectors,
            trim(split_part(connector_details, ',', 1)) as current_type,
            trim(split_part(connector_details, ',', 2)) as power_kw,
            trim(split_part(connector_details, ',', 3)) as connector_type,
            trim(
                replace(split_part(connector_details, ',', 4), 'Status:', '')
            ) as connector_status,
            trim(
                replace(split_part(connector_details, ',', 5), 'Count:', '')
            ) as connector_count
        from connector_list_exploded
    )
select *
from connector_split
