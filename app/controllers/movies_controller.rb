class MoviesController < ApplicationController
  skip_before_action :authenticate, only: [:index, :show]
  
  def index
    @movies = Movie.all
  end
  
  def show
    @movie = Movie.find_by(id: params[:id])
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
