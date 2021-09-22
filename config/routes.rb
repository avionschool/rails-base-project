Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions"}
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" , registrations:  'users/registrations'}
 
  # get 'home/index'
  root 'home#index'
  resources :users do
    get 'homepage', to: 'portfolios#index'
  end
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :wallets, except: [:destroy] do
    collection do
      get 'deposit'
      get 'withdraw'
    end
  end
   get 'wallets_ontroller', to: 'wallets_controller#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
