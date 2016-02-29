# Run this script by doing:
# rails runner lib/import.rb

require 'csv'

# Title,Rating,Runtime,Genre,Released,Director,Writer,Cast,Poster,Plot
input_file = Rails.root.join('lib/movies.csv')

CSV.foreach(input_file) do |row|

  movie = Movie.new

  # Each row in the CSV file is an array
  puts row.inspect

  # What to do?

end