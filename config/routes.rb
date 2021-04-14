Rails.application.routes.draw do
  
  root 'pages#landing'


  devise_for :admins
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
