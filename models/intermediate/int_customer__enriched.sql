with
    -- Importing model from staging
    customer as (
        select *
        from {{ref("stg_erp__customer")}}
    )
    , person as (
        select *
        from {{ref("stg_erp__person")}}
    )
    , store as (
        select *
        from {{ref("stg_erp__store")}}
    )
    -- Joinning tables
    , joined as (
        select
            customer.customer_pk
            , customer.person_fk
            , customer.territory_fk
            , customer.store_fk
            , store.salesperson_fk
            , person.persontype as person_type
            , person.person_full_name
            , store.store_name
        from customer
        left join person on customer.person_fk = person.person_pk
        left join store on customer.store_fk = store.store_pk
    )

    select * from joined
