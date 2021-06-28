Rails.application.routes.draw do
  # Home
  root to: "pages#home"
  # Users
  devise_for :users
  # Admin Only
  get '/admin/users' => 'pages#users', as: 'users_index'
  get '/admin/pending' => 'pages#pending', as: 'users_pending'
  # Buyer or Broker Only
  get '/portfolio' => 'pages#portfolio', as: 'pages_portfolio'
  # All
  get '/transactions' => 'pages#transactions', as: 'pages_transactions'
  # Stocks
  resources :stocks, only: [:index]
end
