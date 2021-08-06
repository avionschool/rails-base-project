Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :stocks
  resources :transactions
  get '/search' => 'stocks#search'

  get '/calculate_total_price' => 'stocks#calculate_total_price', :as => 'calculate_total_price'

  
  # post '/transactions' => 'transactions#create'

end
