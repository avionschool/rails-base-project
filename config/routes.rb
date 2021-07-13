Rails.application.routes.draw do
  root to: 'home#index'
  
#   get '/items/:id' => 'items#index', as: 'items_index'
#   post '/items/create/:id' => 'items#create', as: 'items_create'
  devise_for :users

  resources :items

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
