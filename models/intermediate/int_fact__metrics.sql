with
    --Importing models from staging
    orderdetails as (
        select *
        from {{ref("stg_erp__salesorderdetail")}}
    )
    , orderheader as (
        select *
        from {{ref("stg_erp__salesorderheader")}}
    )
    -- Joining tables
    , joined as (
        select 
            orderdetails.order_item_sk
            , orderdetails.order_fk
            , orderdetails.product_fk
            , orderheader.salesperson_fk
            , orderheader.customer_fk
            , orderheader.territory_fk
            , orderheader.billtoaddress_fk
            , orderheader.shiptoaddress_fk
            , orderheader.creditcard_fk
            , orderheader.orderdate
            , orderheader.duedate
            , orderheader.shipdate
            , orderdetails.unitprice
            , orderdetails.unitpricediscount
            , orderdetails.orderqty
            , orderheader.subtotal
            , orderheader.taxamt
            , orderheader.freight
            , orderheader.totaldue
            , orderheader.orderheader_number
            , orderheader.onlineorderflag
        from orderdetails
        inner join orderheader on orderdetails.order_fk = orderheader.orderheader_pk
    )
    -- Enrichment and treatment of nulls
    , metrics as (
        select 
            order_item_sk
            , order_fk
            , product_fk
            , salesperson_fk
            , customer_fk
            , territory_fk
            , billtoaddress_fk
            , shiptoaddress_fk
            , creditcard_fk
            , orderdate
            , duedate
            , shipdate
            , unitprice
            , unitpricediscount
            , orderqty
            , unitprice * orderqty as gross_total
            , unitprice * orderqty - (1 - unitpricediscount) as net_total
            , subtotal
            , taxamt
            , freight
            , cast(
                freight / count(*) over (partition by orderheader_number) 
                as numeric(18,2)
            ) as freight_allocated
            , totaldue
            , onlineorderflag
        from joined
    )

select * from metrics
