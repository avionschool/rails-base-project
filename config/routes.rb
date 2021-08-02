Rails.application.routes.draw do
  
  devise_for :users, :controllers => { 
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :admins
end
