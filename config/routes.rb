Rails.application.routes.draw do
  devise_for :admins
  devise_for :brokers
  devise_for :buyers
  devise_scope :admin do
    resources :brokers
    resources :buyers
  end
  
  root 'home#index'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
