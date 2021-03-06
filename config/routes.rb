Rails.application.routes.draw do
  resources :users, only: [:create, :show, :index]
  resources :evaluations, only: [:create, :destroy]
  resources :mood_elements, only: [:index]

  get 'evaluations/:user_id', to: 'evaluations#index'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#logged_in?'
end
