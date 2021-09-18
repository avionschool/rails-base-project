Rails.application.routes.draw do
  devise_for :admins, path: 'admins', skip: [:registrations, :passwords]
  devise_for :users, path: 'users'
  resources :static_pages
  resources :users
  # resources :admins #removed resources for admins

  resources :portfolios, only: [:new]
  resources :markets, only: [:index]
  #get '/markets', to: 'static_pages#market_index'


  root 'static_pages#home_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #admin specific routes
  get '/admins/trader-settings', to: 'admins#trader_settings' #list view of users
  get '/admins/approvals', to: 'admins#approvals' #view to approve users
  put '/admins/approvals', to: 'admins#approve_account'
end
