Rails.application.routes.draw do

  #root to: 'stocks#index'
  root to: 'access#menu'

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'
  get 'users/:id/password_reset', :to => 'users#password_reset', :as => 'password_reset_users'
  patch 'users/:id/password_reset', :to => 'users#update_password', :as => 'update_password_users'


  resources :users
  resources :stocks
  resources :stores
  resources :items
  resources :entries
  resources :sales
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
