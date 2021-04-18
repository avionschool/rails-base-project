Rails.application.routes.draw do
  resources :stocks
  resources :transactions
  devise_for :users, controllers: { confirmations: 'confirmations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
