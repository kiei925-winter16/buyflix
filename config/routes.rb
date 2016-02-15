Rails.application.routes.draw do
  resources :movies
  resources :actors
  resources :users
  resources :sessions
  
  get "/logout", to: "sessions#destroy"
  root to: "movies#index"
end
