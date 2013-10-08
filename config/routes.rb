Sendr::Application.routes.draw do
  get 'signup',             to: 'users#new',        as: 'signup'
  get 'login',              to: 'sessions#new',     as: 'login'
  delete 'logout',          to: 'sessions#destroy', as: 'logout'
  get 'home',               to: 'static_pages#home', as: 'home'
  root to: 'static_pages#home'
  
  get 'static_pages/home'
  
  resources :password_resets
  resources :tasks
  resources :tests
  resources :users
  resources :sessions
  ## JSON API
  namespace :api, defaults: { format: 'json'} do
    namespace :v1 do
      resources :tasks
    end
  end
end
