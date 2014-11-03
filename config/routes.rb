Viki::Application.routes.draw do
  devise_for :users
  get "wiki/index"
  get "wiki/about"

  root to: 'wiki#index'

end
