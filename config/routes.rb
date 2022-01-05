Rails.application.routes.draw do
  resources :users
  resources :cryptocurrencies
  resources :wallets
end
