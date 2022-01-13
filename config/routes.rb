require 'resque/server'

Rails.application.routes.draw do
  devise_for :admins, path: 'admins', skip: [:registrations, :passwords]
  devise_for :users, path: 'users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'

  authenticated :user do
    resources :users do
      resources :holdings, only: [:new, :create]
    end
  resources :trade_logs, only: [:index]
  resources :stocks, only: [:index]
  root to: 'users#index', as: :authenticated_root
  end

  
  

  #Session routes
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  #for the search stock, underconstruction
  post "/", to: 'pages#home'

  
  #admin specific routes
  authenticated :admin do
  get '/admin/client_list', to: 'admin#client_list'
  get '/admin/confirmation', to: 'admin#confirmation'
  put '/admin/confirmation', to: 'admin#confirm_user'
  get '/admin/add_user', to: 'admin#add_user'
  post '/admin/add_user', to: 'admin#create_user'
  get 'admin/client_list/:id', to: 'admin#show_user', as: :user_profile
  put '/admin/client_list/:id', to: 'admin#modify_user'
  patch '/admin/client_list/:id', to: 'admin#modify_user'
  get '/admin/client_list/:id', to: 'admin#modify_user'
  get '/admin/client_list/:id/edit', to: 'admin#edit_user', as: :edit_user_profile
  get '/admin/log_book', to: 'admin#log_book'
  end

  #render price updates
  mount Resque::Server.new, at: '/admin/jobs'

end
