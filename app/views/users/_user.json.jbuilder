json.extract! user, :id, :name, :phone, :email, :comments, :password, :rol, :created_at, :updated_at
json.url user_url(user, format: :json)