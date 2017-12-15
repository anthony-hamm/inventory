class Store < ApplicationRecord
	#Associations for Users table
	has_many :users

	#Associations for Entries table
	has_many :entries

	#Associations for Sales table
	has_many :sales

	#Associations for Stock table
	has_many :stocks
	has_many :items, through: :stocks

	#Validations
	validates :name, :presence => {:message => 'es un campo requerido'}
	validates :administrator_id, :presence => {:message => 'es un campo requerido'}

end
