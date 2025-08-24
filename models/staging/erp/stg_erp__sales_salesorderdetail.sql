with 
    source_sales_salesorderdetail as (
    select * 
    from {{ source('erp', 'sales_salesorderdetail') }}
),

renamed as (
    select
        {{ dbt_utils.generate_surrogate_key(['salesorderid', 'salesorderdetailid']) }} as sales_order_item_sk
        , cast(salesorderid as int) as salesorder_fk
        , cast(productid as int) as product_fk
        , cast(specialofferid as int) as specialoffer_fk
        , cast(unitprice as numeric(18,4)) as unitprice
        , cast(unitpricediscount as numeric(18,2)) as unitpricediscount
        , cast(orderqty as int) as orderqty
    from source_sales_salesorderdetail
)

select * from renamed
