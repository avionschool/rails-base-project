Rails.application.routes.draw do

  devise_for :users
  get 'home/index'
  root to: "home#index"
  get "/test", to: "test#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
