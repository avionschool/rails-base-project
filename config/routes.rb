Rails.application.routes.draw do
  
  # match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  devise_for :admins, path: 'admins'#, skip: [:registrations, :passwords]
  devise_for :users, path: 'users'

  resources :stocks, only: [:index]

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
    get 'users', to: "home#index", as: :user_root
    get "test", to: "test#index"
  end

  devise_scope :admin do
    get 'admins/sign_out' => 'devise/sessions#destroy'
    get 'admins', to: 'admins#index', as: :admin_root
    
    # get '/admins/new_user', to: 'admins#new'
    # post '/admins/new_user', to: 'admins#create'
  end

  authenticated :user do
    # root to: 'users#index', as: :user_root
    resources :users
  end
  
  authenticated :admin do
    # delete 'users/:id', to: 'user#destroy', as: :user_destroy
    get 'admins/new_user', to: 'admins#new_user'
    post 'admins/new_user', to: 'admins#create_user'
    get 'admins/user/:id', to: 'admins#show_user', as: :user_profile
    put 'admins/user/:id', to: 'admins#update_user'
    patch 'admins/user/:id', to: 'admins#update_user'
    get 'admins/user/:id/edit', to: 'admins#edit_user', as: :edit_user_profile
  end
  
  # get 'home/index'
  # root to: "home#index"
  
  # resources :users
end
