class Item < ApplicationRecord
	has_many :entries
	has_many :stores, through: :entries
end
