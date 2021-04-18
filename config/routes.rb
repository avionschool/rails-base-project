Rails.application.routes.draw do
  resources :stocks
  resources :transactions
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # HOME PAGE
  root "home#index" # Set home/index as root
  get "home/about"
  post "/" => "home#index"
end
