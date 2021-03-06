Rails.application.routes.draw do

  root 'pages#home'

  resources :users
  resources :shops
  resources :services
  resources :appointments
  resources :schedules
  resources :charges, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
