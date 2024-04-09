Rails.application.routes.draw do

  # API routing
  scope module: 'api', defaults: {format: 'json'} do
    namespace :v1 do
      # provide the routes for the API here
      get 'pets', to: 'pets#index', as: :pets
    end
  end

  # Semi-static page routes
  get 'home', to: 'home#index', as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy

  # Authentication routes
  resources :sessions
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout

  # Resource routes (maps HTTP verbs to controller actions automatically):
  resources :owners
  resources :pets

  # You can have the root of your site routed with 'root'
  root 'home#index'
end
