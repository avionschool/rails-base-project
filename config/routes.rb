Rails.application.routes.draw do

  get '/mainbook' => 'main_books#index'
  get '/mainbook_entries' => 'main_books#mainbook_entries'
  get '/mainbook_entry' => 'main_books#new', as: 'mainbook_new'
  post '/mainbook_entry' => 'main_books#create', as: 'mainbook_entry'
  get '/mainbook/:id/edit' => 'main_books#edit', as: 'edit_mainbook'
  put '/mainbook/:id/edit' => 'main_books#update', as: 'update_mainbook'
  get '/mainbook/:id/delete' => 'main_books#destroy_entry', as: 'delete_entry'

  root 'static_pages#home_page'

  # Admin
  put 'admins/approve' => 'admin_pages#approve_user_payment'
  get 'admins/home' => 'admin_pages#index'

  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }, only: [:sessions]
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations" }, only: [:sessions, :registrations]

  get 'admins/home' => 'admin_pages#index' 
  


  # scope '/checkout' do
  #   post 'create', to: 'checkout#create', as: 'checkout_create'
  #   get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  #   get 'success', to: 'checkout#success', as: 'checkout_success'
  # end

  #resources :checkout, only: [:create]
  post "checkouts/create", to: "checkouts#create"

  resources :mini_books
end
