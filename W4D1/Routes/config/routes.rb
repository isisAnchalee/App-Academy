Routes::Application.routes.draw do
  resources :users, except: [:new, :edit]
  resources :contacts, except: [:new, :edit]
  resources :contact_shares
end
