Rails.application.routes.draw do
<<<<<<< Updated upstream
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions"}
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" , registrations:  'users/registrations'}
=======
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions", registrations: : 'users/registrations'}
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }
>>>>>>> Stashed changes
 
  # get 'home/index'
  root 'home#index'
  resources :users do
    get 'homepage', to: 'portfolios#index'
  end
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  #routes for admin only
  authenticated :admin do
    get '/admins/user-portfolio', to: 'admins#user_portfolio' #list view of users
    get '/admins/approvals', to: 'admins#approvals' #view to approve users
    put '/admins/approvals', to: 'admins#approve_account' #acting to approve the account of user
    get '/admins/add_user', to: 'admins#add_user'
    post '/admins/add_user', to: 'admins#create_user'
    get '/admins/user-portfolio/:id', to: 'admins#show_user', as: :user_profile
    put '/admins/user-portfolio/:id', to: 'admins#modify_user'
    patch '/admins/user-portfolio/:id', to: 'admins#modify_user'
    get '/admins/user-portfolio/:id/edit', to: 'admins#edit_user', as: :edit_user_profile
  end

end
