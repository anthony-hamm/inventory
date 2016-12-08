class Sale < ApplicationRecord
	belongs_to :item
	belongs_to :store

	before_save :calculate_sale_price

	#after_save :reduce_stock

	#Private methods
	protected

	#Calculates the sale price value by multiplying the Sales quantity and the Item price.
	def calculate_sale_price
		self.sale_price = quantity * item.price
	end	

	#After the sale get saved the base stock should be reduce in order to keep 
	#def reduce_stock
	#	self.sale_price = quantity * item.price
	#end	
end
