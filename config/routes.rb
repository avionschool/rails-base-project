Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }

  resources :trades, only: [:index]

  root 'pages#home'
  get '/stocks/:stock_code/trades/new' => 'trades#new', as: 'new_stock_trade'
  post '/stocks/:stock_code/trades/new' => 'trades#create', as: 'create_trade'

  #stocks
  get '/stocks' => 'stocks#index'
end
