class MoviesController < ApplicationController
  
  def index
    @movies = Movie.all
  end
  
  def show
    @movie = Movie.find_by(id: params[:id])
    @studio = Studio.find_by(id: @movie.studio_id)
    @roles = Role.where(movie_id: @movie.id)
  end
  
  def new
    @movie = Movie.new
  end
  
  def create
    Movie.create(params[:movie])
    redirect_to movies_url
  end
  
  def edit
    @movie = Movie.find_by(id: params[:id])
  end
  
  def update
    @movie = Movie.find_by(id: params[:id])
    @movie.update(params[:movie])
    redirect_to movies_url
  end
  
  def destroy
    @movie = Movie.find_by(id: params[:id])
    @movie.destroy
    redirect_to movies_url
  end
  
end
