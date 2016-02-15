Rails.application.routes.draw do
  resources :movies
  resources :actors
  resources :users
  resources :sessions
  
  root to: "movies#index"
end
