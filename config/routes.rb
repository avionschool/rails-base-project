Rails.application.routes.draw do
  devise_for :buyers, :brokers, :admins
  resources :buyers, :brokers, :admins, :users, :broker_stocks, :stocks

  root 'home#index'

   # Admin: Create new accounts
   get '/admins/new_broker' => 'admins#new_broker'
   get '/admins/new_buyer' => 'admins#new_buyer'
   post '/admins/new_broker' => 'admins#create_new_broker'
   post '/admins/new_buyer' => 'admins#create_new_buyer'
  
end
