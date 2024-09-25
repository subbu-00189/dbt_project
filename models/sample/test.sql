with transaction as
(
    select customer_id,
           order_id,
           order_amount,
           product_id,
           order_date
    from public.transactions
),
total_revenue as (
    select customer_id ,
           order_id,
           sum(order_amount) as total_revenue
    from transaction
    group by 1,2
    order by 1
)
select * from total_revenue