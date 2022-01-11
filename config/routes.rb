Rails.application.routes.draw do
  resources :buyer_stocks
  resources :broker_stocks, only: [:create, :destroy, :show]
  devise_for :admins, :controllers => { :sessions => :sessions }
  devise_for :brokers, :controllers => { :registrations => :registrations, :sessions => :sessions }
  devise_for :buyers, :controllers => { :registrations => :registrations, :sessions => :sessions }
  root 'home#index'
  get 'search_stock' => 'stocks#stock_search'
  
  get '/admin/index' => 'admin#index'
  get '/buyer/index' => 'buyer#index'
  get '/broker/index' => 'broker#index'
  get '/broker/portfolio' => 'broker#portfolio'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
