class Entry < ApplicationRecord
	belongs_to :item
	belongs_to :store

	after_save :update_stock, on: :create
	
	#Private methods
	protected

	#Calculates the sale price value by multiplying the Sales quantity and the Item price.
	# def calculate_sale_price
	# 	self.sale_price = quantity * item.price
	# end	

	#After the sale get saved the base stock should be reduce in order to keep 
	def update_stock
		stock = Stock.where(store_id: self.store_id, item_id: self.item_id).first
		# stock.update(:quantity => quantity)
		stock.quantity += quantity
		stock.save
	end	
end