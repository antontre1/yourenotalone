Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :favorites
  resources :articles
  resources :themes
  resources :themes, only: [:show] do
    get 'articles', to: 'articles#index'
  end
  get '/favorites_th', to: 'favorites#index_th'
end
