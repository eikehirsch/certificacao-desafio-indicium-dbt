with 
    person_stateprovince as (
    select * 
    from {{ source('erp', 'person_stateprovince') }}
),

renamed as (
    select
        cast(stateprovinceid as int) as stateprovince_pk
        , cast(territoryid as int) as territory_fk
        , cast(stateprovincecode as varchar) as stateprovincecode
        , cast(countryregioncode as varchar) as countryregioncode
        , cast(isonlystateprovinceflag as boolean) as isonlystateprovinceflag
        , cast(name as varchar) as name
    from person_stateprovince
)

select * from renamed
