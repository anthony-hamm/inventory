class User < ApplicationRecord

	# Handles password, encryption, validation
	has_secure_password

	# Associations for Stores table
	has_many :stores
end
