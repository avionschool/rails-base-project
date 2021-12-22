require 'resque/server'

Rails.application.routes.draw do
  devise_for :admins, path: 'admins', skip: [:registrations, :passwords]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'

  resources :stocks, only: [:index, :show]
  resources :accounts, only: [:new]

  #Session routes
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  #for the search stock, underconstruction
  post "/", to: 'pages#home'


  #admin specific routes
  get '/admin/user-settings', to: 'admin#user_settings'
  get '/admin/confirmation', to: 'admin#confirmation'
  put '/admin/confirmation', to: 'admin#confirm_user'

  #render price updates
  mount Resque::Server.new, at: '/admin/jobs'

end
