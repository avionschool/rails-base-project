Rails.application.routes.draw do

  devise_for :admins
  root to: 'user_path', as: 'users_index'
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :admins
end
