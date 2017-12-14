class User < ApplicationRecord

	# Handles password, encryption, validation
	has_secure_password

	#	#Associations for Stores table
	has_many :stores


	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates :name, :presence => {:message => 'es un campo requerido'},
						:length => { :maximum => 50 , :message => 'soporta una cantidad máxima de 50 letras'}
	validates :phone, :presence => {:message => 'es un campo requerido'},
						:numericality => {:message => 'acepta solo contenido numérico'}
	validates :email, :presence => {:message => 'es un campo requerido'},
						:length => { :maximum => 100 , :message =>  'soporta una cantidad máxima de 100 letras '},
						:format => {:with => EMAIL_REGEX , :message => ' no tiene un formato válido' },
						:confirmation  => true
	validates :password, :presence => {:message => 'es un campo requerido'}
	validates :rol_id, :presence => {:message => 'es un campo requerido'}

end
