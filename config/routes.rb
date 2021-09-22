Rails.application.routes.draw do
  devise_for :users, path: '/', path_names: { sign_in: 'signin',  sign_up: 'signup', sign_out: 'signout' }, controllers: { registrations: "users/registrations", sessions: 'users/sessions' }
  devise_scope :user do
    post '/signin',         to: 'users/sessions#create',       as: 'signin_create'
    post '/signup',         to: 'users/registrations#create',  as: 'signup_create'
    delete '/signout',      to: 'devise/sessions#destroy',      as: 'signout'
  end
  
  # ADMIN ONLY

  get '/admin/dashboard', to: "admin#dashboard", as: 'dashboard_admin'
  get '/admin/pending_user', to: "admin#pending_users", as: 'pending_users'
  get '/admin/user_list', to: "admin#user_list", as: 'user_list'
  patch '/admin/dashboard/:id', to: 'admin#approval', as: 'approve_trader'
  delete '/admin/dashboard/:id', to: 'admin#remove_trader', as: 'remove_trader'
  get '/admin/transaction_history', to: "admin#transactions", as: 'admin_transaction_history'
  get 'admin/new', to: 'admin#new', as: 'new_user'
  post 'admin/new', to: 'admin#create', as: 'create_user'
  get 'admin/edit/:id', to: 'admin#edit', as: 'edit_user'
  patch 'admin/update/:id', to: 'admin#update', as: 'update_user'
  get 'admin/show/:id', to: 'admin#show', as: 'show_user'

  get '/dashboard', to: "home#dashboard"
  root to: "home#index"
end
