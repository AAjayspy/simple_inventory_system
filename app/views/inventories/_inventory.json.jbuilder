json.extract! inventory, :id, :product_id, :warehouse_id, :item_count, :low_item_threshol, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
