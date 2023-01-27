select
    id as payment_id,
    orderid as order_id,
    amount / 100 as amount,
    status,
    created as created_at
from dbt-tutorial.stripe.payment