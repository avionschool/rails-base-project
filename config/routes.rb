Rails.application.routes.draw do
  devise_for :tourists
  devise_for :agencies
  devise_for :admins, skip: :registration
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"

  resources :admins
  resources :agencies, only: [:index, :show]
  resources :tourists, only: :show
  resources :tours, except: [:destroy]
  resources :tourist_tours, except: [:new, :edit, :update]
  resources :travel_transactions, only: [:index]
end
