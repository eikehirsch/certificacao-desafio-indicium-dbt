with
    int_order_header_sales_reason_bridge as (
        select *
        from {{ref("int_order_header_sales_reason_bridge__cleaned")}}
    )

select * from int_order_header_sales_reason_bridge
