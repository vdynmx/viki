Viki::Application.routes.draw do
  devise_for :users

  resources :wikis
  resources :plans, only: [:new, :create]
  resources :collaborators, only: [:create, :destroy]
  
  get "wikis/about"

  root to: 'wikis#index'

end
