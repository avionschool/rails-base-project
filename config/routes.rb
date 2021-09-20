Rails.application.routes.draw do
  resources :user_stocks
  devise_for :users
  
  authenticated :user do
    root 'dashboard#index', as: 'dashboard'
  end

  devise_scope :user do
    root 'pages#home'
  end

  namespace :admin do
    resources :users, only: %i[index show edit update]
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

  resources :stock, except: [:destroy] do
    collection do
      get 'search_stock'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
