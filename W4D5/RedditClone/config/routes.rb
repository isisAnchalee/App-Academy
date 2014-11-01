Rails.application.routes.draw do
  resources :users do 
    resources :subs, only: [:edit, :update]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :subs, except: [:edit, :update] do
    resources :posts, except: [:index]
  end
end
