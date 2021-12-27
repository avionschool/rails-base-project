Rails.application.routes.draw do

  devise_for :admins, path: 'admins', skip: [:registrations, :passwords]
  devise_for :users
  
  get 'home/index'
  root to: "home#index"
  get "/test", to: "test#index"
  
  
  # resource :users,
  #   only: [:edit, :update, :delete],
  #   controller: 'devise/registrations',
  #   as: :user_registration do
  #   get 'cancel'
  # end
  
  resources :users
  # devise_for :users, skip: [:registrations]
end
