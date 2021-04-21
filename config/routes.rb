Rails.application.routes.draw do
  resources :broker_stocks, only: [:create, :destroy]
  devise_for :admins, :controllers => { :sessions => :sessions }
  devise_for :brokers, :controllers => { :registrations => :registrations, :sessions => :sessions }
  devise_for :buyers, :controllers => { :registrations => :registrations, :sessions => :sessions }
  root 'home#index'
  get 'search_stock' => 'stocks#stock_search'
  get '/admin/index' => 'admin#index'
  get '/buyer/index' => 'buyer#index'

  # Broker
  get '/broker/index' => 'broker#index'
  get '/broker/portfolio' => 'broker#portfolio'
  
  # Redirect fix for invalid sign up and sign in
  # devise_scope :buyer do
  # get '/buyers', to: 'devise/registrations#new'
  # get '/buyers/password', to: 'devise/passwords#new'
  # end

  # devise_scope :broker do
  # get '/brokers', to: 'devise/registrations#new'
  # get '/brokers/password', to: 'devise/passwords#new'
  # end

  # devise_scope :admin do
  # get '/admins', to: 'devise/registrations#new'
  # get '/admins/password', to: 'devise/passwords#new'
  # end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
