Rails.application.routes.draw do

  root to: 'stocks_view#index'

  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' }

  resources :users
  get '/get/stock-view' => 'stocks_view#index', as: 'stock_view_index'
  get '/get/stock-view/:stocksymbol' => 'stocks_view#show', as: 'stock_view_show' 
  post '/post/buy-stocks' => 'my_stock#buy_stocks', as: 'post_req_buy_stocks'

end
