Rails.application.routes.draw do
  devise_for :buyers, :brokers, :admins
  resources :users

  root 'home#index'
  
end
