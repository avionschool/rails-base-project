Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'signout', sign_up: 'register' }  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "home#index"
end
