Rails.application.routes.draw do
  devise_for :admins, path: 'admins'
  devise_for :users, path: 'users'
  resources :static_pages
  resources :users
  resources :admins

  root 'static_pages#home_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
