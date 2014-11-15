Viki::Application.routes.draw do
  devise_for :users

  resources :wikis
  
  
  get "wikis/about"

  root to: 'wikis#index'

end
