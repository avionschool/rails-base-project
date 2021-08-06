Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' }
  root to: 'stocks_view#index'
  resources :users
  get '/get/stock-view' => 'stocks_view#index', as: 'stock_view_index'
  get '/get/stock-view/:stocksymbol' => 'stocks_view#show', as: 'stock_view_show' 
  post '/post/buy-stocks' => 'my_stock#buy_stocks', as: 'post_req_buy_stocks'
  
  get '/get/mystocks' => 'stocks_view#view_my_stocks', as: 'stock_view_my_stocks'
  get '/get/transactions' => 'stocks_view#view_transactions', as: 'stock_view_transactions'
end
