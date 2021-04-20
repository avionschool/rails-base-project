Rails.application.routes.draw do
  resources :stocks
  resources :transactions

  # rename devise routes
  devise_for :users,
    :path => '', 
    :path_names => { 
      :sign_in => "sign_in",
      :edit => "edit_user",
      :sign_out => "logout", 
      :sign_up => "sign_up" },
    controllers: { confirmations: 'confirmations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # HOME PAGE
  root "home#index" # Set home/index as root
  get "about", to: "home#about"

  # MARKET
  get '/market', to: "market#index"
  post 'search_stock_in_market' => "market#search_stock_in_market"
  post "add_stock_to_market" => "market#add_stock_to_market"
end
