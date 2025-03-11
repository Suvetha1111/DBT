with source as (
        select * from {{ source('raw', 'order_line_items') }}
  ),
  renamed as (
      select
          {{ adapter.quote("LINE_ITEM_ID") }},
        {{ adapter.quote("ORDER_ID") }},
        {{ adapter.quote("PRODUCT_ID") }},
        {{ adapter.quote("QUANTITY") }},
        {{ adapter.quote("UNIT_PRICE") }},
        {{ adapter.quote("DISCOUNT") }},
        {{ adapter.quote("SUBTOTAL") }},
        {{ adapter.quote("TAX_AMOUNT") }},
        {{ adapter.quote("TOTAL_PRICE") }}

      from source
  )
  select * from renamed
    