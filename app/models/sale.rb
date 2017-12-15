class Sale < ApplicationRecord
	include StockManagementConcern
	belongs_to :item
	belongs_to :store

	before_save :calculate_sale_price

	around_save :update_stock
	before_destroy :increase_stock



	#Private methods
	protected

	#Calculates the sale price value by multiplying the Sales quantity and the Item price.
	def calculate_sale_price
		return if quantity.blank? or item.blank?
		self.sale_price = quantity * item.price
	end

	#After the sale get saved the base stock should be reduce in order to keep
	def update_stock
		increase_stock unless new_record?
		yield
		decrease_stock
	end
end
