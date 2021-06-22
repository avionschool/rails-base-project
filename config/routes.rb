Rails.application.routes.draw do
  devise_for :buyers, :brokers

  root 'home#index'
  
end
