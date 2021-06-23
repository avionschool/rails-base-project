Rails.application.routes.draw do
  devise_for :buyers, :brokers, :admins
  resources :buyers, :brokers, :admins, :users

  root 'home#index'
  
end
