Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'

  # resources :users, only: [:show]
  get "/dashboard", to: "pages#dashboard"
  get "/wall", to: "pages#wall"
  get "/search", to: "pages#search"
  get "/search_bookmarks", to: "pages#search_bookmarks"
  get "/bookmarks", to: "pages#bookmarks"
  get "/home", to: "pages#home_first"
  get "/profiles/:id", to: "pages#pub_profile", as: 'profiles'
  patch "/profiles/:id", to: "pages#toggle_fav"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :favorites
  post '/favorites/:id/create_fav_th', to: 'favorites#create_fav_th', as: 'create_fav_th'
  post '/favorites/:id/create_fav_art', to: 'favorites#create_fav_art', as: 'create_fav_art'
  post '/favorites/:id/create_fav_user', to: 'favorites#create_fav_user', as: 'create_fav_user'
  resources :articles
  resources :articles do
    resources :comments, only: [ :new, :create, :index, :destroy ]
    resources :votes, only: [ :new, :create, :destroy ]
  end
  resources :themes
  resources :themes, only: [:show] do
    get '/articles', to: 'articles#index'
  end
  get '/favorites_th', to: 'favorites#index_th'
  get '/favorites_art', to: 'favorites#index_art'
  get '/favorites_user', to: 'favorites#index_user'
end
