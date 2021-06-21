Rails.application.routes.draw do
    # devise_for :users, :buyers, :brokers

    devise_for :buyers, :brokers

    # devise_for :users, controllers: {
    # registrations: 'buyers/registrations'
    # }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  
  
end
