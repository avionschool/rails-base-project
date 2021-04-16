Rails.application.routes.draw do
  devise_for :admins
  devise_for :brokers, :controllers => { :registrations => :registrations }
  devise_for :buyers, :controllers => { :registrations => :registrations }
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
