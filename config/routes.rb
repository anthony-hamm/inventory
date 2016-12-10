Rails.application.routes.draw do
  resources :users
  resources :stocks
  resources :stores
  resources :items
  resources :entries
  resources :sales
  root to: 'stocks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
