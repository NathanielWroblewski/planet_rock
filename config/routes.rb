PlanetRock::Application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  root to: 'application#index'
  resources :application, only: :index
  resources :countries, only: :index
end
