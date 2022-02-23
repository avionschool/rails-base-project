Rails.application.routes.draw do
  devise_for :traders
  devise_for :admins, :skip => [:registrations]

  authenticated :admin do
    get '/admin/dashboard' => "admins#index"
  end
  
    get '/trader/dashboard' => "traders#index"
  
  root to: 'traders#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
