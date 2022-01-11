Rails.application.routes.draw do
  devise_for :admins, :controllers => { :sessions => :sessions }
  devise_for :brokers, :controllers => { :registrations => :registrations, :sessions => :sessions }
  devise_for :buyers, :controllers => { :registrations => :registrations, :sessions => :sessions }
  root 'home#index'
  namespace :api do
    get '/global_news' => 'news#index'
    get '/exchange_news' => 'news#Index'
  end
  get 'search_stock' => 'stocks#stock_search'
  
  get '/admin/index' => 'admin#index'
  get '/buyer/index' => 'buyer#index'
  get '/broker/index' => 'broker#index'
  get '/broker/portfolio' => 'broker#portfolio'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
