Rails.application.routes.draw do
  devise_for :users, controllers: {
            registrations: "users/registrations",
            sessions: "users/sessions"
          }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  # get "/users/sign_up" => "registrations#create"
  get "/dashboard" => 'home#show'
  get "/admin" => 'users#index', as: 'admin'
  get "/marketplace" => 'transactions#index'
  get "/transactions/show" => 'transactions#show', as: 'transaction_logs'
  get "/transactions/new" => 'transactions#new'
  get "/stocks" => 'stocks#index', as: 'stocks'
  get "/user/confirm" => 'users#confirm', as: 'confirm_user'
end
