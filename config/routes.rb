Rails.application.routes.draw do

  root to: 'stocks_view#index'
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  get '/get/stock-view' => 'stocks_view#index', as: 'stock_view_index'
  get '/get/stock-view/:stocksymbol' => 'stocks_view#show', as: 'stock_view_show' 
 
end
