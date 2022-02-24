

Rails.application.routes.draw do
  devise_for :traders
  devise_for :admins, :skip => [:registrations]

  devise_scope :trader do
    post 'traders/sign_up', to: 'devise/registrations#create'
  end

  authenticated :admin do
    get '/admin/dashboard' => "admins#index"
  end
  
  
  authenticated :trader do
      get '/traders/dashboard', to: "traders#index", as: "trader_portfolio"
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
