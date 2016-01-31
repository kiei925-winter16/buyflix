# Deletes everything from the database so that you start fresh
puts "Deleting all records from the database..."
Studio.delete_all
Movie.delete_all
Actor.delete_all
Role.delete_all

# Create the studios
puts "Creating studios..."
paramount = Studio.create(name: "Paramount")
lucasfilm = Studio.create(name: "Lucasfilm")
universal = Studio.create(name: "Universal")
fox = Studio.create(name: "Twentieth Century Fox")
marvel = Studio.create(name: "Marvel")

# Create the movies
puts "Creating movies..."
raiders = Movie.create(studio_id: paramount.id, name: "Raiders of the Lost Ark", image: "raiders.jpg", summary: "Archaeologist and adventurer Indiana Jones is hired by the US government to find the Ark of the Covenant before the Nazis.", year_released: "1981", rating: "PG", genre: "Action", runtime: "115 min", price: 1299)
star_wars = Movie.create(studio_id: lucasfilm.id, name: "Star Wars", image: "starwars.jpg", summary: "Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a wookiee and two droids to save the universe from the Empire's world-destroying battle-station, while also attempting to rescue Princess Leia from the evil Darth Vader.", year_released: "1977", rating: "PG", genre: "Action", runtime: "121 min", price: 1499)
apollo_13 = Movie.create(studio_id: universal.id, name: "Apollo 13", image: "apollo13.jpg", summary: "NASA must devise a strategy to return Apollo 13 to Earth safely after the spacecraft undergoes massive internal damage putting the lives of the three astronauts on board in jeopardy.", year_released: "1995", rating: "PG", genre: "Drama", runtime: "140 min", price: 1299)
cast_away = Movie.create(studio_id: fox.id, name: "Cast Away", image: "castaway.jpg", summary: "A FedEx executive must transform himself physically and emotionally to survive a crash landing on a deserted island.", year_released: "2000", rating: "PG-13", genre: "Drama", runtime: "143 min", price: 1099)
guardians = Movie.create(studio_id: marvel.id, name: "Guardians of the Galaxy", image: "guardians.jpg", summary: "A group of intergalactic criminals are forced to work together to stop a fanatical warrior from taking control of the universe.", year_released: "2014", rating: "PG-13", genre: "Action", runtime: "121 mins", price: 1499)

# Create the actors
puts "Creating actors..."
ford = Actor.create(name: "Harrison Ford")
fisher = Actor.create(name: "Carrie Fisher")
hanks = Actor.create(name: "Tom Hanks")
hunt = Actor.create(name: "Helen Hunt")
pratt = Actor.create(name: "Chris Pratt")
zoe = Actor.create(name: "Zoe Saldana")
dave = Actor.create(name: "Dave Bautista")
vin = Actor.create(name: "Vin Diesel")
bradley = Actor.create(name: "Bradley Cooper")

puts "Creating roles..."

# Create the roles for Raiders of the Lost Ark
Role.create(movie_id: raiders.id, actor_id: ford.id, character_name: "Indiana Jones")

# Create the roles for Star Wars
Role.create(movie_id: star_wars.id, actor_id: ford.id, character_name: "Han Solo")
Role.create(movie_id: star_wars.id, actor_id: fisher.id, character_name: "Princess Leia")

# Create the roles for Apollo 13
Role.create(movie_id: apollo_13.id, actor_id: hanks.id, character_name: "Jim Lovell")

# Create the roles for Cast Away
Role.create(movie_id: cast_away.id, actor_id: hanks.id, character_name: "Chuck Noland")
Role.create(movie_id: cast_away.id, actor_id: hunt.id, character_name: "Kelly Frears")

# Create the roles for Guardians of the Galaxy
Role.create(movie_id: guardians.id, actor_id: pratt.id, character_name: "Peter Quill")
Role.create(movie_id: guardians.id, actor_id: zoe.id, character_name: "Gamora")
Role.create(movie_id: guardians.id, actor_id: dave.id, character_name: "Drax")
Role.create(movie_id: guardians.id, actor_id: vin.id, character_name: "Groot")
Role.create(movie_id: guardians.id, actor_id: bradley.id, character_name: "Rocket")

puts "There are now #{Studio.count} studios, #{Movie.count} movies, #{Actor.count} actors, and #{Role.count} roles in the database."