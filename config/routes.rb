Sendr::Application.routes.draw do
  resources :tasks
  resources :tests
  ## JSON API
  namespace :api, defaults: { format: 'json'} do
    namespace :v1 do
      resources :tasks
    end
  end
end
