Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }

  resources :users do
    member do
      get :confirm_email
    end
  end

  resources :locations

  get 'users/:id/history' => 'users#history', as: 'user_history'
  
  root to: 'home#index'
  
  post '/comments/comment/:id' => 'comments#comment', as: 'comment'
  put '/comments/:id' => 'comments#update', as: 'update_comment'
  delete '/comments/:id' => 'comments#delete', as: 'delete_comment'
 
  resources :items do 
    resources :conversations do
        resources :messages
    end

    resources :transact do
        resources :reviews
    end
  end

end
