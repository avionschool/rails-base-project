Rails.application.routes.draw do
  devise_for :users
  get 'dashboard', to: 'dashboard#index'
  root 'pages#home'
  resources :wallets, except: [:destroy] do
    collection do
      get 'deposit'
      get 'withdraw'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
