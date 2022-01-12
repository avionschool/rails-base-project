Rails.application.routes.draw do
  devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  end
  scope '/admins' do
    resources :users
    resources :coins
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  
  get "/admins/users", to: "admins#users"
  get "/admins/coins", to: "admins#coins"
  post "/admins/coins/:id", to: "coins#destroy"
  get "/admins", to: "admins#index"

  resources :trades, param: :base
  resources :coins
  resources :wallets do
    resources :orders
  end

  post '/trades/:id', to:'orders#create'

end
