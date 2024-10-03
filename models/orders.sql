{{
    config(
        materialized='incremental',
       
    )
}}



select * from {{'stg_orders'}}

{% if is_incremental() %}

where
  order_date > (select max(order_date) from {{ this }})

{% endif %}