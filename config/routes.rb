Rails.application.routes.draw do
  get '/movies', to: 'movies#index'
  get '/movies/new', to: 'movies#new'
  post '/movies', to: 'movies#create'
  get '/movies/:id', to: 'movies#show'
  get '/movies/:id/edit', to: 'movies#edit'
  patch '/movies/:id', to: 'movies#update'
  delete '/movies/:id', to: 'movies#destroy'
  
  get '/actors', to: 'actors#index'
  get '/actors/new', to: 'actors#new', as: 'new_actor'
  post '/actors', to: 'actors#create'
  get '/actors/:id', to: 'actors#show'
  get '/actors/:id/edit', to: 'actors#edit'
  patch '/actors/:id', to: 'actors#update'
  delete '/actors/:id', to: 'actors#destroy'
  
  root to: "movies#index"
end
