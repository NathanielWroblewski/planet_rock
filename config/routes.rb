PlanetRock::Application.routes.draw do
  root to: 'application#index'
  resources :application, only: :index
  resources :countries, only: :index
end
