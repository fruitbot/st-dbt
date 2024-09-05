select
    order_details_id
from {{ ref('stg_order_details') }}
where order_details_quantity < 0