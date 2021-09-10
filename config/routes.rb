Rails.application.routes.draw do

  
  devise_scope :trader do
    root to: 'devise/sessions#new'
  end
  
  devise_for :traders
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
