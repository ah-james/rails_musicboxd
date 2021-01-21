Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :users
  resources :albums do
    resources :reviews, only: :new
  end
  resources :reviews do
    resources :favorite_tracks, only: :new
  end
  resources :artists
  resources :favorite_tracks


end
