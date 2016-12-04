json.extract! sale, :id, :store_id, :item_id, :quantity, :sale_price, :created_at, :updated_at
json.url sale_url(sale, format: :json)