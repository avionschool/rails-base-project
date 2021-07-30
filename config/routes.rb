Rails.application.routes.draw do

  root to: 'users#index', as: 'users_index'
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
end
