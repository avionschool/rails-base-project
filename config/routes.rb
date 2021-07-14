Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  
  root to: 'home#index'
  
  
  resources :items
  post '/items/comment/:id' => 'items#comment', as: 'items_comment'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
