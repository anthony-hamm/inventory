json.extract! stock, :id, :store_id, :item_id, :quantity, :created_at, :updated_at
json.url stock_url(stock, format: :json)