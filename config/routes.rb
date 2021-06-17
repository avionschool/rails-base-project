Rails.application.routes.draw do
  devise_for :admins
  devise_for :buyers
  devise_for :brokers

  resources :stocks, only: [ :index, :show, :create, :destroy ]

  resources :home, only: [ :index, :portfolio ] do
    collection do # would not ask for a param
      get 'portfolio'
     end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
end
