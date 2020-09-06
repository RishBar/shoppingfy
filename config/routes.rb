Rails.application.routes.draw do

  root to: 'sessions#new'

  resources :users
  resources :stores
  resources :products

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
