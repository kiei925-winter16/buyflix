Rails.application.routes.draw do
  resources :movies
  resources :actors
  resources :users
  resources :sessions
  resources :charges
  
  get "/logout", to: "sessions#destroy"
  root to: "movies#index"
end
