Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }

  resources :stocks do
    resources :trades, only: [:new]
  end

  resources :trades, only: [:index]

  root 'pages#home'
  post '/stocks/:stock_id/trades/new' => 'trades#create', as: 'create_trade'
end
