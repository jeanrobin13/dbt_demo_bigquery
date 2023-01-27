with orders as (
    select * from {{ ref('stg_orders')}}
),

payments as(
    select * from {{ ref('stg_payments')}}
),

payment_orders as (

    select
        order_id,
        sum(case when status = 'success' then amount end) as amount

    from payments

    group by 1

),


final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        payment_orders.amount
        

    from orders

    left join payment_orders using (order_id)

)

select * from final