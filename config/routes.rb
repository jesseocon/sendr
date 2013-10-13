Sendr::Application.routes.draw do
  
  #sign in pages
  get 'signup',             to: 'users#new',            as: 'signup'
  get 'login',              to: 'sessions#new',         as: 'login'
  delete 'logout',          to: 'sessions#destroy',     as: 'logout'
  
  # static pages 
  get 'about',              to: 'static_pages#about',   as: 'about'
  get 'docs',               to: 'static_pages#docs',    as: 'docs'
  get 'home',               to: 'static_pages#home',    as: 'home'
  get 'pricing',            to: 'static_pages#pricing', as: 'pricing'
  
  # root of the app
  root to: 'static_pages#home'

  get 'static_pages/about'
  get 'static_pages/docs'
  get 'static_pages/home'
  get 'static_pages/pricing'
  
  resources :apps
  resources :demos
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
