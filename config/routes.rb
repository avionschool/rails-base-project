Rails.application.routes.draw do

  root 'static_pages#home_page'

  # MainBook
  get '/mainbook' => 'main_books#index'
  get '/mainbook_entries' => 'main_books#mainbook_entries'
  get '/mainbook_entry' => 'main_books#new', as: 'mainbook_new'
  post '/mainbook_entry' => 'main_books#create', as: 'mainbook_entry'
  get '/mainbook/:id/edit' => 'main_books#edit', as: 'edit_mainbook'
  put '/mainbook/:id/edit' => 'main_books#update', as: 'update_mainbook'
  post '/mainbook/:id/delete' => 'main_books#destroy_entry', as: 'delete_entry'

  # MiniBook
  get '/minibooks' => 'mini_books#index'
  get '/minibook_new' => 'mini_books#new', as: 'minibook_new'
  post '/minibook_new' => 'mini_books#create', as: 'minibook_create'
  get '/minibook/:id/edit' => 'mini_books#edit', as: 'edit_minibook'
  put '/minibook/:id/edit' => 'mini_books#update', as: 'update_minibook'
  post '/minibook/:id/delete' => 'mini_books#destroy', as: 'delete_minibook'

  # Admin
  put 'admins/approve' => 'admin_pages#approve_user_payment'
  get 'admins/home' => 'admin_pages#index'

  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }, only: [:sessions]
  devise_for :users, path: 'users', controllers: { registrations: "users/registrations" }

  get 'admins/home' => 'admin_pages#index' 
  
  # scope '/checkout' do
  #   post 'create', to: 'checkout#create', as: 'checkout_create'
  #   get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  #   get 'success', to: 'checkout#success', as: 'checkout_success'
  # end

  #resources :checkout, only: [:create]
  post "checkouts/create", to: "checkouts#create"

  # Products
  get '/products' => 'abc_products#index'
  get '/product/:id/show' => 'abc_products#show', as: 'abc_product_show'
  get '/product_new' => 'abc_products#new', as: 'abc_product_new'
  post '/product_new' => 'abc_products#create', as: 'abc_product_create'
  get '/product/:id/edit' => 'abc_products#edit', as: 'edit_abc_product'
  put '/product/:id/edit' => 'abc_products#update', as: 'update_abc_product'
  post '/product/:id/delete' => 'abc_products#destroy', as: 'delete_abc_product'
end
