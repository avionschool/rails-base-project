Rails.application.routes.draw do
  devise_for :admins, :controllers => { :sessions => :sessions }
  devise_for :brokers, :controllers => { :registrations => :registrations, :sessions => :sessions }
  devise_for :buyers, :controllers => { :registrations => :registrations, :sessions => :sessions }
  root 'home#index'
  get '/admin' => 'admin#index'
  get '/buyer' => 'buyer#index'
  get '/broker' => 'broker#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
