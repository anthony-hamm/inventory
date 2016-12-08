Rails.application.routes.draw do
  resources :users
  resources :stocks
  root to: 'stores#index'
  resources :stores
  resources :items
  resources :entries
  resources :sales
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
