with 
    countryregion as (
        select * 
        from {{ source('erp', 'person_countryregion') }}
    )
    , renamed as (
        select
            cast(countryregioncode as varchar) as countryregion_pk
            , cast(name as varchar) as country_name
        from countryregion
    )

select * from renamed
