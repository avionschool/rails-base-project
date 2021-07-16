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
  
  post '/comments/comment/:id' => 'comments#comment', as: 'comment'
  put '/comments/:id' => 'comments#update', as: 'update_comment'
  delete '/comments/:id' => 'comments#delete', as: 'delete_comment'
  put '/items/:id' => 'items#update', as: 'update_post'
  delete '/items/:id' => 'items#delete', as: 'delete_post'

  
  resources :items do 
    resources :conversations do
        resources :messages
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
