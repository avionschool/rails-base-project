Rails.application.routes.draw do
  devise_for :admins
  devise_for :buyers
  devise_for :brokers

  resources :home do
    collection do
      get 'portfolio'
      get 'stocks'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
end
