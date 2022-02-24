Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :admins, :skip => [:registrations]

  authenticated :admin do
    get '/admins/view-traders', to: 'admins#view_traders'
    get '/admins/approvals', to: 'admins#approvals'
    
    # approve or reject a trader
    put '/admin/approvals', to: 'admins#approve_trader_account'

    get '/admins/add-trader', to: 'admins#add_trader'

    # create trader manually
    post '/admin/add-trader', to: 'admins#create_trader'

    get '/admins/trader-profile/:id', to: 'admins#show_trader' # put alias when there is a trader profile

    # edit and update trader
    get '/admins/trader-profile/:id', to: 'admins#edit_trader' # put alias when there is a trader profile
    put '/admins/trader-profile/:id', to: 'admins#update_trader'

    get '/admins/view-transactions', to: 'admins#view_transactions' # put alias when there is a trader's transactions list

  end

  authenticated :user do
    get '/users', to: 'users#index', as: 'user_portfolio'
  end


end
