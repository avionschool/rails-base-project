Rails.application.routes.draw do

  root 'pages#landing'
  get 'buyers/portfolio'=> 'buyers#portfolio', as: "buyers_portfolio"
  get 'brokers/portfolio'=> 'brokers#portfolio', as: "brokers_portfolio"
  
  resources :brokers
  resources :buyers
  devise_for :admins
  devise_for :users, controllers: { sessions: 'users/sessions',registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
