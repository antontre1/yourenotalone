Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "dashboard", to: "pages#dashboard"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :favorites
  post '/favorites/:id/create_fav_th', to: 'favorites#create_fav_th', as: 'create_fav_th'
  resources :articles
  resources :themes
  resources :themes, only: [:show] do
    get 'articles', to: 'articles#index'
  end
  get '/favorites_th', to: 'favorites#index_th'
end
