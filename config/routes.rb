Viki::Application.routes.draw do
  devise_for :users

  resources :wikis
  resources :plans, only: [:new, :create]
  
  get "wikis/about"

  root to: 'wikis#index'

end
