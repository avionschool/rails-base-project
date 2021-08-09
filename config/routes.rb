Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :stocks
  resources :transactions
  resources :portfolios
  get '/search' => 'stocks#search'

  get '/calculate_total_price' => 'stocks#calculate_total_price', :as => 'calculate_total_price'
  get '/calculate_sell_price' => 'portfolios#calculate_sell_price', :as => 'calculate_sell_price'

  post '/buy_stock' => 'transactions#buy_stock', :as => 'buy_stock'

  post '/sell_stock' => 'portfolios#sell_stock', :as => 'sell_stock'

  
  # post '/transactions' => 'transactions#create'

end
