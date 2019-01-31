Rails.application.routes.draw do
  get 'clients/new'
  get 'clients/edit'
  get 'clients/show'
  root 'pages#home'

  resources :users
  resources :clients
  resources :shops
  resources :services
  resources :appointments
  resources :charges, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
