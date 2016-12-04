class Store < ApplicationRecord
	has_many :entries
	has_many :items, through: :entries
end
