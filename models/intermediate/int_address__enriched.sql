with 
    -- Importing model from staging
    address as (
        select * 
        from {{ ref("stg_erp__address") }}
    )
    , stateprovince as (
        select *
        from {{ ref("stg_erp__stateprovince") }}
    )
    , countryregion as (
        select * 
        from {{ref("stg_erp__countryregion")}}
    )
    -- Joinning tables
    , joined as (
        select 
            address.address_pk
            , address.addressline1
            , address.addressline2
            , address.city_name
            , stateprovince.state_name
            , countryregion.country_name
        from address
        left join stateprovince on address.stateprovince_fk = stateprovince.stateprovince_pk
        left join countryregion on stateprovince.countryregion_fk = countryregion.countryregion_pk
    )
    select * from joined
