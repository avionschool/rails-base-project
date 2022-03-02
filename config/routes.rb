

Rails.application.routes.draw do
  get 'home/index'
  devise_for :traders
  devise_for :admins, :skip => [:registrations]

  devise_scope :trader do
    post 'traders/sign_up', to: 'devise/registrations#create'
  end

  authenticated :admin do
    get '/admin/dashboard' => "admins#index"
    get '/admin/approvals' => "admins#for_approval"
    put '/admin/pending/:id' => "admins#approved", as: "for_pending"
    get '/admin/create-new-trader' => "admins#new_trader"
    post '/admin/create-new-trader' => "admins#create_new_trader", as: "admin_create_trader"
  end
  
  authenticated :trader do
    get '/markets', to: "markets#index" , as: "stock_market"
    root to: 'traders#index', as: "trader_portfolio"
  end
    root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
