Rails.application.routes.draw do
  devise_for :users, path: '/', path_names: { sign_in: 'signin',  sign_up: 'signup', sign_out: 'signout' }, controllers: { registrations: "users/registrations", sessions: 'users/sessions' }
  devise_scope :user do
    post '/signin',         to: 'users/sessions#create',       as: 'signin_create'
    post '/signup',         to: 'users/registrations#create',  as: 'signup_create'
    delete '/signout',      to: 'devise/sessions#destroy',      as: 'signout'
  end
  
  root to: "home#index"
  get '/home', to: "home#home"
end
