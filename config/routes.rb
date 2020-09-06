Rails.application.routes.draw do

  root to: 'sessions#new'

  resources :users
  resources :stores do
    resources :categories do
      resources :products
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
