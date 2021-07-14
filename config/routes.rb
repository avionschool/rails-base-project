Rails.application.routes.draw do
  resources :cpus  do
    match '/scrape', to: 'cpus#scrape', via: :post, on: :collection
  end

  root to: 'vehicles#index'
end
