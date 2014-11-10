Viki::Application.routes.draw do
  devise_for :users

  resources :wikis
  
  
  get "wiki/about"

  root to: 'wiki#index'

end
