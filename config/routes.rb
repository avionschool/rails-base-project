Rails.application.routes.draw do
  # Home
  root to: "pages#home"
  # Users
  devise_for :users
  # Admin Only
  get '/admin/users' => 'admin#users', as: 'users_index'
  get '/admin/pending' => 'admin#pending', as: 'users_pending'
  patch '/admin/pending/:id' => 'admin#approve_pending', as: 'users_approve_pending'
  get '/admin/user/:id' => 'admin#show', as: 'user_show'
  get '/admin/users/new' => 'admin#new', as: 'user_new'
  post '/admin/users' => 'admin#create', as: 'user_create'
  get '/admin/user/:id/edit' => 'admin#edit', as: 'user_edit'
  put '/admin/users:id/edit' => 'admin#update', as: 'user_update'
  # Buyer or Broker Only
  get '/portfolio' => 'pages#portfolio', as: 'pages_portfolio'
  # All
  get '/transactions' => 'pages#transactions', as: 'pages_transactions'
  # Stocks
  resources :stocks, only: [:index]
  # Broker Stocks
  post '/stocks/broker/:id' => 'broker_stocks#add_stock', as: 'stock_add' #Adds stock to broker
  # Transactions
  post '/stocks/buyer/:id' => 'transactions#add_broker_stock', as: 'broker_stock_add' #Adds broker_stock to buyer
  # FOr buying and selling stocks
  get '/portfolio/:id/buy' => 'pages#buy', as: 'buy'
  post '/portfolio/:id/buy' => 'pages#buy_stock', as: 'buy_stock'
end
