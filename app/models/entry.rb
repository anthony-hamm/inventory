class Entry < ApplicationRecord
	include StockManagementConcern
	belongs_to :item
	belongs_to :store

	around_save :update_stock
	before_destroy :decrease_stock

	#Private methods
	protected

	# After the entry get saved the base stock should be increase in order to keep the consistency of the stock
	def update_stock
		decrease_stock unless new_record?
		yield
		increase_stock
	end
end
