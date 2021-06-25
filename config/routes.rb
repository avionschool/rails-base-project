Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  root :to => 'sessions#welcome'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'dashboard_buyer', to: 'sessions#index_buyer'
  get 'dashboard_broker', to: 'sessions#index_broker'
  get 'dashboard_admin', to: 'sessions#index_admin'
  get 'logout', to: 'sessions#out'
end
