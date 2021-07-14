Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  root to: 'home#index'
  
  get '/items/:id' => 'items#index', as: 'items_index'
  post '/items/create/:id' => 'items#create', as: 'items_create'
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
