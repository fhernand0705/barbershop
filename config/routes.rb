Rails.application.routes.draw do
  root 'pages#home'

  resources :users
  resources :shops

  post '/signup', to: 'users#create'
  patch '/users/:id', to: 'users#update'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'schedules/new'
  get 'schedules/edit'
  get 'schedules/show'
  get 'schedules/index'
  get 'services/new'
  get 'services/edit'
  get 'services/index'
  get 'services/show'
  get 'appointments/new'
  get 'appointments/edit'
  get 'appointments/show'
  get 'appointments/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
