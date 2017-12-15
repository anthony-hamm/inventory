class Entry < ApplicationRecord
	belongs_to :item
	belongs_to :store

	around_save :update_stock
	before_destroy :decrease_stock

	#Private methods
	protected

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

	# After the entry get saved the base stock should be increase in order to keep the consistency of the stock
	def update_stock
		decrease_stock unless new_record?
		yield
		increase_stock
	end
end
