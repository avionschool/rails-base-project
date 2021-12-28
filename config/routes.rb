Rails.application.routes.draw do

  devise_for :admins, path: 'admins'#, skip: [:registrations, :passwords]
  devise_for :users, path: 'users'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users', to: "home#index", :as => :user_root
    get "/test", to: "test#index"
  end

  devise_scope :admin do
    get '/admins/sign_out' => 'devise/sessions#destroy'
    get '/admins', to: 'admins#index', :as => :admin_root
  
    get '/admins/new_user', to: 'admins#new'
    post '/admins/new_user', to: 'admins#create'
  end
  
  # get 'home/index'
  # root to: "home#index"
  
  
  # resource :users,
  #   only: [:edit, :update, :delete],
  #   controller: 'devise/registrations',
  #   as: :user_registration do
  #   get 'cancel'
  # end


  resources :users
  # devise_for :users, skip: [:registrations]
end
