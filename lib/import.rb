# Run this script by doing:
# rails runner lib/import.rb

require 'csv'

Movie.delete_all

# Title:0,Rating:1,Runtime:2,Genre:3,Released:4,Director:5,Writer:6,Cast:7,Poster:8,Plot:9
input_file = Rails.root.join('lib/movies.csv')

CSV.foreach(input_file) do |row|

  movie = Movie.new
  movie.name = row[0]
  movie.rating = row[1]
  movie.runtime = row[2]
  movie.year_released = "2015"
  movie.image = row[8]
  movie.summary = row[9]

  movie.save
  
  actor_names = row[7].split(", ")
  actor_names.each do |actor_name|
    actor = Actor.find_or_create_by(name: actor_name)
    Role.create(movie: movie, actor: actor)
  end
  genre_names = row[3].split(", ")
  genre_names.each do |genre_name|
    genre = Genre.find_or_create_by(name: genre_name)
    Categorization.create(movie: movie, genre: genre)
  end
  
end