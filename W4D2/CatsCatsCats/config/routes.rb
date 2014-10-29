Rails.application.routes.draw do
  resources :cats
  resources :cat_rental_requests do
    member do
      post 'approve'
      post 'deny'
      get 'approve'
      get 'deny'
    end
  end
  
end