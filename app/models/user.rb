class User < ApplicationRecord

	# Handles password, encryption, validation
	has_secure_password

	#	#Associations for Stores table
	has_many :store_users
	has_many :stores, through: :store_users


	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates :name, :presence => {:message => 'es un campo requerido'},
						:length => { :maximum => 50 , :message => 'soporta una cantidad máxima de 50 letras'}
	validates :phone, :numericality => {:message => 'acepta solo contenido numérico'}, if: -> (phone) {:phone.empty?}
	validates :email, :length => { :maximum => 100 , :message =>  'soporta una cantidad máxima de 100 letras '},
						:format => {:with => EMAIL_REGEX , :message => ' no tiene un formato válido' }, if: -> (email) {:email.empty?}
	validates :username, :presence => {:message => 'es un campo requerido'}
	validates :password, :presence => {:message => 'es un campo requerido'}, if: -> (user) { user.new_record? }
	validates :rol_id, :presence => {:message => 'es un campo requerido'}
	validates :store_ids, :presence => {:message => 'es un campo requerido'}
end
