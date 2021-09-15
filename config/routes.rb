Rails.application.routes.draw do
  resources :user_stocks
  devise_for :users
  root 'pages#home'
<<<<<<< Updated upstream
<<<<<<< Updated upstream
  get 'dashboard', to: 'dashboard#index'
=======
=======
>>>>>>> Stashed changes

  post "/" => 'pages#home'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
