Rails.application.routes.draw do
  devise_for :users
  scope "/admin" do
    resources :users
  end
  get "/admin/home", to: 'users#admin_home', as: 'admin_home'
  get "/admin/pending_users", to: 'users#pending_users', as: 'pending_user'
  post "/admin/:id/pending_users", to: 'users#approve_pending', as: 'approve_pending_user'
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'stock/search', to: 'stocks#search'
  get 'transactions', to:'user_stocks#transactions'
  get 'my_portfolio', to:'user_stocks#my_portfolio'
  get 'marketplace', to: 'stocks#index', as: 'marketplace'
  resources :user_stocks, only: [:create, :destroy]

  get 'new_order(/:id)', to: 'user_stocks#new', as: 'new_user_stock'
  post 'stocks/order', to: 'user_stocks#order', as: 'order_stocks'
  get 'stocks/:id', to: 'stocks#show', as:'stock'

end

