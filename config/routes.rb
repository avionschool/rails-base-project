Rails.application.routes.draw do  
  root 'pages#landing'

  get 'adminpages/index'=> 'adminpages#index',as: 'admins_index'
  post 'adminpages/create'=> 'adminpages#create',as: 'admins_create'
  post 'adminpages/update'=> 'adminpages#update',as: 'admins_update'
  get '/adminpages/:id/confirm', to: 'adminpages#confirm', as: 'admins_confirm'
  get '/adminpages/:id/edit', to: 'adminpages#edit', as: 'admins_edit'
  get '/adminpages/user', to: 'adminpages#user', as: 'admins_user'
 

  get 'buyers/portfolio'=> 'buyers#portfolio', as: "buyers_portfolio"
  get 'brokers/portfolio'=> 'brokers#portfolio', as: "brokers_portfolio"
  
  resources :brokers
  resources :buyers
  resources :adminpages, only: [:index, :create, :new, :destroy, :update]

  devise_for :users, controllers: { sessions: 'users/sessions',registrations: 'users/registrations' }
  devise_for :admins, controllers: { sessions: 'admins/sessions',registrations: 'admins/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
