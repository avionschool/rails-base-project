Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :suppliers, :controllers => { :registrations => :registrations }
  devise_for :buyers, :controllers => { :registrations => :registrations }
  devise_for :admins, :controllers => { :registrations => :registrations }


  root to: "welcome#index"

  resources :suppliers
  resources :buyers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
