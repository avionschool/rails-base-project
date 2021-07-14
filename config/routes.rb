Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  
  root to: 'home#index'
  
  get '/items/:id' => 'items#index', as: 'items_index'
  post '/items/create/:id' => 'items#create', as: 'items_create'
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
