class MoviesController < ApplicationController
  skip_before_action :authenticate, only: [:index, :show]
  
  def index
    if params[:genre_id]
      genre = Genre.find_by(id: params[:genre_id])
      @movies = genre.movies
    else
      @movies = Movie.all
    end
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
    @movie.image = omdb.poster
    @movie.format = "Widescreen"
    @movie.save
    actor_names = omdb.actors.split(", ")
    actor_names.each do |actor_name|
      actor = Actor.find_or_create_by(name: actor_name)
      Role.create(movie: @movie, actor: actor)
    end
    genre_names = omdb.genre.split(", ")
    genre_names.each do |genre_name|
      genre = Genre.find_or_create_by(name: genre_name)
      Categorization.create(movie: @movie, genre: genre)
    end
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
