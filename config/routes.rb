Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/facebook/callback', to: 'sessions#omniauth'
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :albums do
    resources :reviews, only: [:new, :index]
  end
  resources :reviews
  resources :artists
  resources :tracks


end
