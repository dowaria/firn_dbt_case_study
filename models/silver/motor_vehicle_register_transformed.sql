{{ config(materialized="table") }}

with
    motor_vehicle_register_transformed as (
        select distinct * from {{ ref("motor_vehicle_register") }}
    )
select * from motor_vehicle_register_transformed
