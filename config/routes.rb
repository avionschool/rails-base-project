Rails.application.routes.draw do
  devise_for :users
  
  devise_for :review_centers, 
  path: 'rc',
  controllers: {
    sessions: 'review_centers/sessions',
    registrations: 'review_centers/registrations'
  }

  devise_scope :review_center do
    authenticated do
      root to: 'rc_pages#home', as: 'authenticated_rc_root'
    end
  end


  root 'public_pages#landing'
end
