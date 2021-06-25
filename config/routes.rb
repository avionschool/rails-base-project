Rails.application.routes.draw do
  devise_for :brokers
  devise_for :buyers
  # devise_for :users
  root 'home#index'

  # get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  # get "/sign_up" => "registrations#new"
  # post "/admins" => "registrations#create"
  # get "/admins/new" => "admins#new"
  # get "/admins" => "admins#index"
  # post "/admins" => "admins#create"
  resources :admins, only: %i[index new create]

  get "/admins/sign_in" => "admin_sessions#new"
  post "/admins/sign_in" => "admin_sessions#create"
  delete "/logout" => "admin_sessions#destroy"
  get "/redirect" => "admin_sessions#redirect"

  get "/admins/new_broker" => "admins#new_broker"
  post "/admins/new_broker" => "admins#create_broker"

  resources :broker_stocks
  resources :buyer_stocks
end
