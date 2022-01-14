Rails.application.routes.draw do
  resources :buyer_stocks
  resources :broker_stocks, only: [:create, :destroy, :show]
  devise_for :admins, :controllers => { :sessions => :sessions }
  devise_for :brokers, :controllers => { :registrations => :registrations, :sessions => :sessions }
  devise_for :buyers, :controllers => { :registrations => :registrations, :sessions => :sessions }
  root 'home#index'
  namespace :api do
    get '/global_news' => 'news#index'
    get '/businessNews' => 'freenews#index'
    get '/healthNews' => 'freenews#healthNews'
    get '/exchange_news' => 'news#exchangeNews'

  end
  get 'search_stock' => 'stocks#stock_search'

  # Admin
  get '/admin/index' => 'admin#index'
  get '/admin/users' => 'admin#users'
  # Admin: Create new accounts
  get '/admin/new_broker' => 'admin#new_broker'
  get '/admin/new_buyer' => 'admin#new_buyer'
  post '/admin/new_broker' => 'admin#create_new_broker'
  post '/admin/new_buyer' => 'admin#create_new_buyer'
  # Admin: View Accounts
  get '/admin/brokers/:id' => 'admin#show_broker', as: :show_broker
  get '/admin/buyers/:id' => 'admin#show_buyer', as: :show_buyer
  # Admin: Edit Accounts
  get '/admin/brokers/:id/edit' => 'admin#edit_broker', as: :edit_broker
  get '/admin/buyer/:id/edit' => 'admin#edit_buyer', as: :edit_buyer
  patch '/admin/brokers/:id/edit' => 'admin#update_broker'
  patch '/admin/buyer/:id/edit' => 'admin#update_buyer'
  # Admin: View Transactions
  get '/admin/transactions' => 'admin#transactions'
  # Admin: View Pending Accounts
  get '/admin/pending_accounts' => 'admin#pending_accounts'
  # Admin: Confirm accounts
  get '/admin/brokers/:id/confirm' => 'admin#confirm_broker', as: :confirm_broker
  get '/admin/buyers/:id/confirm' => 'admin#confirm_buyer', as: :confirm_buyer
  # Broker
  get '/broker/index' => 'broker#index'
  get '/broker/portfolio' => 'broker#portfolio'
  get '/broker/transactions' => 'broker#transactions'

  # Buyer
  get '/buyer/index' => 'buyer#index'
  get '/buyer/portfolio' => 'buyer#portfolio'
  get '/buyer/transactions' => 'buyer#transactions'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
