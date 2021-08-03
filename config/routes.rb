Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :stocks
  resources :transactions
  get '/search' => 'stocks#search'

  get '/compute_total_price' => 'transactions#compute_total_price'
end
