with
    int_sales_order_reason_bridge as (
        select *
        from {{ref("int_sales_order_reason_bridge__cleaned")}}
    )

select * from int_sales_order_reason_bridge
