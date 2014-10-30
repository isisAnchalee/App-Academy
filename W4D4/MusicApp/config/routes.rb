Rails.application.routes.draw do

resources :users, only: [:new, :create]

resource :session, only: [:new, :create, :destroy]

resources :bands

resources :bands, only: [:show] do
	resources :albums, only: [:new]
end

resources :albums, except: [:show, :new, :put, :index]

resources :albums, only: [:show] do
	resources :tracks, only: [:new]
end

resources :tracks, except: [:new, :index]

end
