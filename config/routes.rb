Rails.application.routes.draw do  
  root 'pages#landing'

  #custom 'get' routes
  get 'adminpages/index'=> 'adminpages#index',as: 'admins_index'
  get '/adminpages/:id/confirm', to: 'adminpages#confirm', as: 'admins_confirm'
  get '/adminpages/:id/edit', to: 'adminpages#edit', as: 'admins_edit'
  get '/adminpages/user', to: 'adminpages#user', as: 'admins_user'
  get 'buyers/portfolio'=> 'buyers#portfolio', as: "buyers_portfolio"
  get 'brokers/portfolio'=> 'brokers#portfolio', as: "brokers_portfolio"
  get 'brokers/transactions'=> 'brokers#transactions', as: "brokers_transaction"
  get 'buyers/transactions'=> 'buyers#transactions', as: "buyers_transaction"
  get '/adminpages/transactions'=> 'adminpages#transactions', as: "adminpages_transaction"

  get 'search_stock' => 'brokers#search' 

  get '/buyers/:id/new', to: 'buyers#new', as: 'buyers_new'
  post '/buyers/create' => 'buyers#create', as: 'create_buyers'

  #custom 'post' routes
  post 'adminpages/create'=> 'adminpages#create',as: 'admins_create'
  post 'adminpages/:id/edit'=> 'adminpages#update'
  post '/brokers/create' => 'brokers#create', as: 'create_brokers'

  # 'resource' based routes
  resources :brokers
  resources :buyers
  resources :adminpages, only: [:index, :create, :new, :destroy]

  # 'devise_for' configurations
  devise_for :users, controllers: { sessions: 'users/sessions',registrations: 'users/registrations' }
  devise_for :admins, controllers: { sessions: 'admins/sessions',registrations: 'admins/registrations' }
end
