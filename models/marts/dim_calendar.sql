-- models/marts/dimensions/dim_calendar.sql

{{ config(materialized='table') }}

with dim_calendar as (
    {{ dbt_date.get_date_dimension("2011-05-31", "2014-06-30") }}
)

select * from dim_calendar