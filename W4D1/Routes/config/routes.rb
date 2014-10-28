Routes::Application.routes.draw do
  resources :contacts, except: [:new, :edit, :index] do
    resources :comments, only: [:index]
  end

  resources :users, except: [:new, :edit] do
    resources :contacts, only: [:index]
    resources :comments, only: [:index]
  end

  resources :comments, only: [:show, :update, :destroy, :create]
  resources :contact_shares, only: [:create, :destroy]
end
