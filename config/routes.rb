Rails.application.routes.draw do
  devise_for :users

  resources :stocks do
    resources :trades, only: [:new]
  end

  resources :trades, only: [:index]

  root 'pages#home'
  post '/stocks/:stock_id/trades/new' => 'trades#create', as: 'create_trade'
end
