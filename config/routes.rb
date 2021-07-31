Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :stocks
  resources :transactions
  get '/search' => 'stocks#search'
  get '/search' => 'transactions#index'

  get '/compute_total_price' => 'stocks#index'
end
