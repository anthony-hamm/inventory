class Entry < ApplicationRecord
	belongs_to :item
	belongs_to :store

	after_save :update_stock, on: :create

	#Private methods
	protected

	# After the entry get saved the base stock should be increase in order to keep the consistency of the stock
	def update_stock
		stock = Stock.where(store_id: self.store_id, item_id: self.item_id).first
		# stock.update(:quantity => quantity)
		return if stock.blank?
		stock.quantity += quantity
		stock.save
	end
end
