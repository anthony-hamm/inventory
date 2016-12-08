class User < ApplicationRecord
	#Associations for Stores table
	has_many :stores
end
