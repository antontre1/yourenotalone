Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # resources :users, only: [:show]
  get "dashboard", to: "pages#dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :favorites
  post '/favorites/:id/create_fav_th', to: 'favorites#create_fav_th', as: 'create_fav_th'
  post '/favorites/:id/create_fav_art', to: 'favorites#create_fav_art', as: 'create_fav_art'
  resources :articles
  resources :articles do
    resources :comments, only: [ :new, :create, :index, :destroy ]
    resources :votes, only: [ :new, :create, :destroy ]
  end
  resources :themes
  resources :themes, only: [:show] do
    get 'articles', to: 'articles#index'
  end
  get '/favorites_th', to: 'favorites#index_th'
  get '/favorites_art', to: 'favorites#index_art'
end
