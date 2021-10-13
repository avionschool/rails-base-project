Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions", registrations: "admins/registrations" }, only: [:sessions, :registrations]

  get 'admins/home' => 'admin_pages#index'

end
