Rails.application.routes.draw do
  devise_for :users
  root  'users#index'
  resources :items
  resources :supermarkets
  resources :wants
end


