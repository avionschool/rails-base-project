Rails.application.routes.draw do
  devise_for :users, path: '/', path_names: { sign_in: 'signin',  sign_up: 'signup', sign_out: 'signout' }, controllers: { registrations: "users/registrations", sessions: 'users/sessions' }
  devise_scope :user do
    post '/signin',         to: 'users/sessions#create',       as: 'signin_create'
    post '/signup',         to: 'users/registrations#create',  as: 'signup_create'
    delete '/signout',      to: 'devise/sessions#destroy',      as: 'signout'
  end
  
  # ADMIN ONLY

  get '/admin/dashboard', to: "admin#dashboard", as: 'dashboard_admin'
  get '/admin/pending_user', to: "admin#pending_users", as: 'pending_users'
  get '/admin/user_list', to: "admin#user_list", as: 'user_list'
  patch '/admin/dashboard/:id', to: 'admin#approval', as: 'approve_trader'
  delete '/admin/dashboard/:id', to: 'admin#remove_trader', as: 'remove_trader'
  get '/admin/transaction_history', to: "admin#transactions", as: 'admin_transaction_history'
  get 'admin/new', to: 'admin#new', as: 'new_user'
  post 'admin/new', to: 'admin#create', as: 'create_user'
  get 'admin/edit/:id', to: 'admin#edit', as: 'edit_user'
  patch 'admin/update/:id', to: 'admin#update', as: 'update_user'
  get 'admin/show/:id', to: 'admin#show', as: 'show_user'

  # TRADER ONLY
  
  get '/stock_market', to: "trader_stocks#stock_market", as: "stock_market"
  get 'stocks/my_stock', to: 'trader_stocks#trader_stock', as: 'trader_stock'
  get 'stocks/search', to: 'trader_stocks#search', as: 'search_stock'
  get 'stocks/transaction_history', to: 'trader_stocks#transaction_history', as: 'transaction_history'
  get 'stocks/search/buy/:ticker', to: 'trader_stocks#buy_stock_new', as: 'get_buy_stock'
  post 'stocks/search/buy/:ticker', to: 'trader_stocks#buy_stock', as: 'buy_stock'
  get 'stocks/sell/:id/:ticker', to: 'trader_stocks#sell_stock_new', as: 'get_sell_stock'
  post 'stocks/sell/:id/:ticker', to: 'trader_stocks#sell_stock', as: 'sell_stock'
  get '/topup_money', to: "trader_stocks#topup_money_new", as: "topup_money_new"
  post '/topup_money', to: "trader_stocks#topup_money", as: "topup_money"
  delete '/stocks/:id', to: 'trader_stocks#remove_stock', as: 'remove_stock'

  get '/dashboard', to: "home#dashboard"
  root to: "home#index"
end
