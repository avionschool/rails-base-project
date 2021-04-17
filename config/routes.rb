Rails.application.routes.draw do

  get 'admins/new'
  get 'admins/create'
  get 'admins/edit'
  get 'admins/update'
  get 'admins/show'
  get 'admins/index'=> 'admins#index', as: "admins"
  root 'pages#landing'
  get 'buyers/portfolio'=> 'buyers#portfolio', as: "buyers_portfolio"
  get 'brokers/portfolio'=> 'brokers#portfolio', as: "brokers_portfolio"
  
  resources :brokers
  resources :buyers

  devise_for :users, controllers: { sessions: 'users/sessions',registrations: 'users/registrations' }
  devise_for :admins, controllers: { sessions: 'admins/sessions',registrations: 'admins/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
