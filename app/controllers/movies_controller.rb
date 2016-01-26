class MoviesController < ApplicationController
  
  def index
    @movies = Movie.all
  end
  
  def show
    @movie = Movie.find_by(id: params[:id])
    @studio = Studio.find_by(id: @movie.studio_id)
    @roles = Role.where(movie_id: @movie.id)
  end
  
end
