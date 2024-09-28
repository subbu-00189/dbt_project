{{config(materialized='table')}}
with customers as
(
   select * from {{ref('stg_customers')}}
),
orders as
(
    select * from {{ref('stg_orders')}}
),
employee as(
    select employee_id,
           customer_id
    from {{ref('employee')}}
),
customer_orders as
(
    select customer_id,
           min(order_date) as first_order_date,
           max(order_date) as recent_order_date,
           count(order_id) as number_of_orders
    from orders
    group by 1
       
),
final as
(
    select  customers.customer_id,
            customers.first_name,
            customers.last_name,
            employee.employee_id is not null as is_employee

            -- customer_orders.first_order_date,
            -- customer_orders.recent_order_date,
            -- coalesce(customer_orders.number_of_orders,0) number_of_orders
    from customers 
        --   left join customer_orders using(customer_id)
          left join employee using(customer_id)  
)
select * from final