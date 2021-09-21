Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }

  get 'admins/home' => 'admin_portals#index'
  put 'admins/manage' => 'admin_portals#approve_user'
  get 'admins/manage' => 'admin_portals#edit_user'
  put 'admins/manage' => 'admin_portals#update_user'
  get 'admins/view' => 'admin_portals#show_user'

  resources :trades, only: [:index]

  root 'pages#landing'

  # buy/sell transaction
  get '/stocks/:stock_code/trades/new' => 'trades#new', as: 'new_stock_trade'
  post '/stocks/:stock_code/trades' => 'trades#create', as: 'create_trade'

  #pages
  get '/home' => 'pages#home'
  get '/portfolio' => 'pages#portfolio'
  get '/stocks' => 'stocks#index'
  get '/transactions' => 'pages#transactions'
end
