Rails.application.routes.draw do
  devise_for :buyers, :brokers, :admins

  root 'home#index'
  
end
