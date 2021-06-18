Rails.application.routes.draw do
  devise_for :admins
  devise_for :buyers
  devise_for :brokers

  resources :stocks, only: [ :index, :show, :create, :destroy ] do
    collection do
      post 'add_stock'
    end
  end

  resources :home, only: [ :index, :portfolio, :transaction ] do
    collection do # would not ask for a param
      get 'portfolio'
      get 'transaction'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
end
