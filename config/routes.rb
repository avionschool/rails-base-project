Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }

  resources :users do
    member do
      get :confirm_email
    end
  end
  
  root to: 'home#index'
  
  post '/items/comment/:id' => 'items#comment', as: 'items_comment'
  put '/items/:id' => 'items#update_comment', as: 'update_comment'
  delete '/items/:id' => 'items#delete_comment', as: 'delete_comment'

  resources :items do 
    resources :conversations do
        resources :messages
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
