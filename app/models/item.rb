class Item < ApplicationRecord
	#Associations for Entries table
	has_many :entries
	has_many :stores, through: :entries

	#Associations for Sales table
	has_many :sales
	has_many :stores, through: :sales

	#Associations for Stock table
	has_many :stocks
	has_many :stores, through: :stocks

	#Validations
	validates :name, :presence => {:message => 'es un campo requerido'}
	validates :description, :presence => {:message => 'es un campo requerido'}

end

