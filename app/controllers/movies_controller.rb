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
    @movie = Movie.new
    omdb = OMDB.title(params[:movie][:name])
    @movie.name = omdb.title
    @movie.summary = omdb.plot
    @movie.rating = omdb.rated
    @movie.runtime = omdb.runtime
    @movie.year_released = omdb.year
    @movie.genre = omdb.genre
    @movie.image = omdb.poster
    @movie.format = "Widescreen"
    @movie.save
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
