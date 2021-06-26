Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'stock/search', to: 'stocks#search'
  get 'transactions', to:'user_stocks#transactions'
  get 'my_portfolio', to:'user_stocks#my_portfolio'
  get 'marketplace', to: 'stocks#index', as: 'marketplace'
end

