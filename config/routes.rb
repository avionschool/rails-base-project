Rails.application.routes.draw do
  devise_for :admins
  get '/admins/approve/:id' => 'admins#approve', as: 'approve'
  get '/admins/approvals' => 'admins#approval', as: 'admin_broker_approval'

  devise_for :brokers
  resources :brokers

  devise_for :buyers
  resources :buyers

  root 'home#index'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
