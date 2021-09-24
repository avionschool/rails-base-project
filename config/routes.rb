Rails.application.routes.draw do
  resources :user_stocks
  devise_for :users, controllers: { registrations: "registrations" }
  
  authenticated :user do
    root 'dashboard#index', as: 'dashboard'
  end

  devise_scope :user do
    root 'pages#home'
  end

  resources :users, :only=>[:edit, :update, :show, :index]

  namespace :admin do
    resources :users, only: %i[index show edit update destroy]
    patch 'users/:id/approve', to: 'users#approve', as: 'user_approve'
  end

  resources :wallets, except: [:destroy] do
    collection do
      get 'deposit'
      get 'withdraw'
    end
  end

  resources :portfolio, only: [:index] do
    collection do
      get 'transactions'
      get 'pending_orders'
    end
  end
  
  get 'market', to: 'users#market'
  get 'search_stock', to: 'stocks#search'


  post 'stock/sell', to: 'sell_orders#sell', as: 'stock_sell'
  post 'stock/buy', to: 'buy_orders#buy', as: 'stock_buy'

  resources :stocks, only: [:show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
