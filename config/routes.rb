Rails.application.routes.draw do

  root to: 'stores#index'

  resources :users
  resources :stores do
    resources :categories do
      resources :products
    end
    resource :cart, only: [:show] do
      post   :add_item
      post   :remove_item
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
