Rails.application.routes.draw do
  devise_for :admins
  
  devise_for :nutritionists
  devise_for :users

  root 'home#index'
  get '/home/approve/:id' => 'home#approve', as: 'approve'

  resources :food

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
