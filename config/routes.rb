Rails.application.routes.draw do

  # get 'home/index'
  root to: 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'users/sign_up', to: 'devise/registrations#create'
  end

  devise_for :admins, :skip => [:registrations]

  authenticated :admin do
    get '/admins/view_traders', to: 'admins#view_traders'
    get '/admins/approvals', to: 'admins#approvals'
    
    # approve or reject a trader
    put '/admin/approvals', to: 'admins#approve_trader_account'

    get '/admins/add_trader', to: 'admins#add_trader'

    # create trader manually
    post '/admins/add_trader', to: 'admins#create_trader'

    get '/admins/trader_profile/:id', to: 'admins#show_trader', as: :trader_profile

    # edit and update trader
    get '/admins/trader_profile/:id/edit', to: 'admins#edit_trader', as: :edit_trader_profile
    put '/admins/trader_profile/:id', to: 'admins#update_trader'

    get '/admins/view_transactions', to: 'admins#view_transactions', as: :view_trader_transactions

  end

  authenticated :user do
    get '/users', to: 'users#index', as: 'user_portfolio'
    get '/users/markets', to: 'markets#index', as: 'stock_markets'
    get '/users/transactions', to: 'transactions#index', as: 'user_transaction'

    resources :users do
      resources :portfolios, only: [:new, :create]
    end
  end

  get '/page-not-found', action: :error404, controller: 'static_pages'
  get "*path" => 'static_pages#error404'

end
