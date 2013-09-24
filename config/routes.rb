Sendr::Application.routes.draw do
  get 'signup',     to: 'users#new',        as: 'signup'
  get 'login',      to: 'sessions#new',     as: 'login'
  delete 'logout',  to: 'sessions#destroy', as: 'logout'
  
  resources :tasks
  resources :tests
  resources :users
  ## JSON API
  namespace :api, defaults: { format: 'json'} do
    namespace :v1 do
      resources :tasks
    end
  end
end
