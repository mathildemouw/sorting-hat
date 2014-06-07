require "CSV"
require_relative "house.rb"

class HouseCalculator

  def self.movie_genre_receiver(movie_hash)
    movie_house_frequency(movie_hash.values.flatten) # => {H: 3, R: 2, G: 5, S: 4} (accumulated total)
  end


  def self.movie_house_frequency(genre_array)
    house_points = initialize_empty_house_points
    genre_array.each do |genre|
      house_points[fetch_house(genre)] += 1
    end
    return house_points # => {H: 0, R: 1, G: 1, S: 0} or more
  end

  private

  def self.initialize_empty_house_points #HELPER METHOD to start hashes
    house_points = {}
    House.house_names.each do |house_name|
      house_points[house_name] = 0
    end
    return house_points # => {H: 0, R: 0, G: 0, S: 0} (zeroed out)
  end

  def self.fetch_house(genre) #HELPER METHOD to connect to CSV
    CSV.foreach('genres.csv', {headers: true}) do |row|
      return row["house"] if row["genre"] == genre
    end
  end

  def self.select_house_from_genres(genre_array) #NOT TIED INTO CURRENT LOGIC. Legacy.
    single_house_points = movie_house_frequency(genre_array)
    top_score = single_house_points.values.max
    single_house_points.select{|k,v| v==top_score}.keys.sample # => Returns the top-most house for a specific movie's genre-array. Ties are decided randomly.
  end
end

#TESTING SUITE

def assert
  raise "Assertion failed" unless yield
end

assert{HouseCalculator.fetch_house("Film-noir") == "Ravenclaw"}
assert{HouseCalculator.fetch_house("Crime") == "Slytherin"}


test_hash = {"movie1" => ["Action", "Comedy", "Sci-fi"]}
assert {HouseCalculator.movie_genre_receiver(test_hash) == {"Gryffindor"=>2, "Slytherin"=>0, "Hufflepuff"=>1, "Ravenclaw"=>0}}

test_hash2 = {"movie2" => ["Western", "Comedy"],
              "movie3" => ["Western", "Film-noir", "Musical"]}
assert{HouseCalculator.movie_genre_receiver(test_hash2) == {"Gryffindor"=>2, "Slytherin"=>0, "Hufflepuff"=>2, "Ravenclaw"=>1}}
