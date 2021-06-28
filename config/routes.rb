Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  root :to => 'sessions#welcome'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'dashboard', to: 'sessions#index'
  get 'dashboard_admin', to: 'sessions#index_admin'
  get 'logout', to: 'sessions#out'

  get 'approve', to: 'sessions#approve'
  get '/users/details/:id' => 'users#details', as: 'users_details'
  put '/users/update/:id' => 'users#update', as: 'users_update'

  resources :stocks
  get 'search-stock', to: 'stocks#search'
end
