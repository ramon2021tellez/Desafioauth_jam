Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 resources :sessions , only: [:new, :create, :destroy]
  # Defines the root path route ("/")
  root "home#index"
  
end
