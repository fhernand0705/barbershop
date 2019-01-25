Rails.application.routes.draw do
  resources :users
  resources :shops

  # add root path (homepage)

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
