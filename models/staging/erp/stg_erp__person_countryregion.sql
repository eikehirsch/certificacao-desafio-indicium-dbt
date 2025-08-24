with 
    source_person_countryregion as (
    select * 
    from {{ source('erp', 'person_countryregion') }}
),

renamed as (
    select
        cast(countryregioncode as varchar) as countryregion_pk
        , cast(name as varchar) as name
    from source_person_countryregion
)

select * from renamed
