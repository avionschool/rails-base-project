Rails.application.routes.draw do

  devise_for :users
  get 'home/index'
  root to: "home#index"
  get "/test", to: "test#index"

  resources :users
end
