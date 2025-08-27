with
    -- Importing model from staging
    stg_erp__customer as (
        select *
        from {{ref("stg_erp__customer")}}
    )
    , stg_erp__person as (
        select *
        from {{ref("stg_erp__person")}}
    )
    , stg_erp__store as (
        select *
        from {{ref("stg_erp__store")}}
    )
    -- Joinning tables
    , joined as (
        select
            stg_erp__customer.customer_pk
            , stg_erp__customer.person_fk
            , stg_erp__customer.territory_fk
            , stg_erp__customer.store_fk
            , stg_erp__store.salesperson_fk
            , stg_erp__person.persontype as person_type
            , stg_erp__person.firstname || ' ' || stg_erp__person.lastname AS person_full_name
            , stg_erp__store.store_name
        from stg_erp__customer
        left join stg_erp__person on stg_erp__customer.person_fk = stg_erp__person.person_pk
        left join stg_erp__store on stg_erp__customer.store_fk = stg_erp__store.store_pk
    )

    select * from joined
