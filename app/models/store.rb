class Store < ApplicationRecord
	#Associations for Entries table
	has_many :entries
	has_many :items, through: :entries

	#Associations for Sales table
	has_many :sales
	has_many :items, through: :sales	

	#Associations for Stock table
	has_many :stocks
	has_many :items, through: :stocks
end
