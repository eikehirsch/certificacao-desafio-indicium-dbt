with 
    -- Importing model from staging
    stg_erp__address as (
        select * 
        from {{ ref("stg_erp__address") }}
    )
    , stg_erp__stateprovince as (
        select *
        from {{ ref("stg_erp__stateprovince") }}
    )
    , stg_erp__countryregion as (
        select * 
        from {{ref("stg_erp__countryregion")}}
    )
    -- Joinning tables
    , joined as (
        select 
            stg_erp__address.address_pk
            , stg_erp__address.addressline1
            , stg_erp__address.addressline2
            , stg_erp__address.city_name
            , stg_erp__stateprovince.state_name
            , stg_erp__countryregion.country_name
        from stg_erp__address
        left join stg_erp__stateprovince on stg_erp__address.stateprovince_fk = stg_erp__stateprovince.stateprovince_pk
        left join stg_erp__countryregion on stg_erp__stateprovince.countryregion_fk = stg_erp__countryregion.countryregion_pk
    )
    select * from joined
