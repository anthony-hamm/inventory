Rails.application.routes.draw do

  #root to: 'stocks#index'
  root to: 'access#menu'

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :users
  resources :stocks
  resources :stores do
    resources :snapshots
  end
  resources :items
  resources :entries
  resources :sales
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
