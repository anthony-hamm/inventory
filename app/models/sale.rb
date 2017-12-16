class Sale < ApplicationRecord
	belongs_to :item
	belongs_to :store

	before_save :calculate_sale_price

	around_save :update_stock
	before_destroy :increase_stock

  #Validations
	validates_presence_of :store_id, :item, :quantity , :message => 'es un campo requerido'


	#Private methods
	protected

	def decrease_stock
		stock = Stock.find_or_create_by(store_id: self.store_id, item_id: self.item_id)
		stock.quantity = stock.quantity.to_i - quantity.to_i
		stock.save
	end

	def increase_stock
		stock = Stock.find_or_create_by(store_id: self.store_id_was, item_id: self.item_id_was)
		stock.quantity = stock.quantity.to_i + quantity_was.to_i
		stock.save
	end

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
