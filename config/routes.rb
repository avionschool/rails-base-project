Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources: :stocks, only: [:index]
end
