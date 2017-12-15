module StockManagementConcern
  def decrease_stock
    stock = Stock.find_or_create_by(store_id: self.store_id_was, item_id: self.item_id_was)
    stock.quantity = stock.quantity.to_i - quantity_was.to_i
    stock.save
  end

  def increase_stock
    stock = Stock.find_or_create_by(store_id: self.store_id, item_id: self.item_id)
    stock.quantity = stock.quantity.to_i + quantity.to_i
    stock.save
  end
end
