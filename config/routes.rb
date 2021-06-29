Rails.application.routes.draw do
  # Home
  root to: "pages#home"
  # Users
  devise_for :users
  # Admin Only
  get '/admin/users' => 'pages#users', as: 'users_index'
  get '/admin/pending' => 'pages#pending', as: 'users_pending'
  # get 'admin/pending/:id' => 'pages#edit_pending', as: 'users_edit_pending'
  patch '/admin/pending/:id' => 'pages#approve_pending', as: 'users_approve_pending'
  # Buyer or Broker Only
  get '/portfolio' => 'pages#portfolio', as: 'pages_portfolio'
  # All
  get '/transactions' => 'pages#transactions', as: 'pages_transactions'
  # Stocks
  resources :stocks, only: [:index]
  # Broker Stocks
  post '/stocks/:id' => 'broker_stocks#add_stock', as: 'stock_add'
end
