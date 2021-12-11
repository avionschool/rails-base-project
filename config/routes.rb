 Rails.application.routes.draw do
  resources :stocks
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'


  #Session routes
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  #for the search stock, underconstruction
  post "/", to: 'pages#home'
end
