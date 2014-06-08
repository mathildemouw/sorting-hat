require "CSV"

class HouseCalculator

  @@house_points = {
    "Gryffindor" => 0,
    "Slytherin" => 0,
    "Hufflepuff" => 0,
    "Ravenclaw" => 0
  }

  def self.calculate_total_house_points(movie_hash)
    genres = movie_hash.values.flatten
    genres.each do |genre|
      @@house_points[fetch_house(genre)] += 1
    end
    return @@house_points # => {H: 0, R: 1, G: 1, S: 0} or more
  end

  private

  def self.fetch_house(genre) #HELPER METHOD to connect to CSV
    CSV.foreach(APP_ROOT.to_path + "/app/models/genres.csv", {headers: true}) do |row|
      return row['house'] if row['genre'] == genre
    end
  end
end

#TESTING SUITE

# def assert
#   raise "Assertion failed" unless yield
# end

# assert{HouseCalculator.fetch_house("Film-noir") == "Ravenclaw"}
# assert{HouseCalculator.fetch_house("Crime") == "Slytherin"}


# test_hash = {"movie1" => ["Action", "Comedy", "Sci-fi"]}
# assert {HouseCalculator.movie_genre_receiver(test_hash) == {"Gryffindor"=>2, "Slytherin"=>0, "Hufflepuff"=>1, "Ravenclaw"=>0}}

# test_hash2 = {"movie2" => ["Western", "Comedy"],
#               "movie3" => ["Western", "Film-noir", "Musical"]}
# assert{HouseCalculator.movie_genre_receiver(test_hash2) == {"Gryffindor"=>2, "Slytherin"=>0, "Hufflepuff"=>2, "Ravenclaw"=>1}}
