with 
    source_stateprovince as (
    select * 
    from {{ source('erp', 'person_stateprovince') }}
),

renamed as (
    select
        cast(stateprovinceid as int) as stateprovince_pk
        , cast(countryregioncode as varchar) as countryregion_fk
        , cast(territoryid as int) as territory_fk
        , cast(stateprovincecode as varchar) as stateprovincecode
        , cast(isonlystateprovinceflag as boolean) as isonlystateprovinceflag
        , cast(name as varchar) as state_name
    from source_stateprovince
)

select * from renamed
