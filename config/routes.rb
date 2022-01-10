Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :cryptocurrencies
  resources :wallets
end
