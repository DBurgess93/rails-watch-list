# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# TODO
# clean up database
Movie.destroy_all
List.destroy_all
# bookmarks too later

require "json"
require "open-uri"

url = "https://tmdb.lewagon.com/movie/top_rated?api_key=%3Cyour_api_key%3E"
movies_serialized = URI.open(url).read
movie = JSON.parse(movies_serialized)

results = movie['results']

10.times do
  results.each do |result|
    Movie.create(title: result['original_title'], overview: result['overview'], poster_url: result['poster_path'], rating: result['vote_average'])
  end
end

List.create!(name: "Comedies")
List.create!(name: "Actions")
List.create!(name: "thrillers")
List.create!(name: "Jim Carrey Movies")
List.create!(name: "LOTR Films")


# pp movie['results']
# title = results[0]['original_title']
# overview = results[0]['overview']
# poster_url = results[0]['poster_path']
# puts "#{result['original_title']} - #{result['overview']} - #{result['poster_path']}"

# pp title
# pp overview
# pp poster_url

# puts "#{user["name"]} - #{user["bio"]}"

# https://image.tmdb.org/t/p/original
