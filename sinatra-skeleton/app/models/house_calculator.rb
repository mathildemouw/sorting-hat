require "CSV"
require_relative "house.rb"

class HouseCalculator

  def self.select_house_from_genres(genre_array)
    initialize_frequency_collector
    count_house_frequency(genre_array)
    top_score = @frequency_collector.values.max
    @frequency_collector.select{|k,v| v==top_score}.keys.sample
  end

  def self.initialize_frequency_collector
    @frequency_collector = {}
    House.house_names.each do |house_name|
      @frequency_collector[house_name] = 0
    end
  end

  def self.count_house_frequency(genre_array)
    genre_array.each do |genre|
      @frequency_collector[fetch_house(genre)] += 1
    end
    @frequency_collector
  end

  def self.fetch_house(genre)
    CSV.foreach('genres.csv', {headers: true}) do |row|
      return row["house"] if row["genre"] == genre
    end
  end
end

#TESTING SUITE

def assert
  raise "Assertion failed" unless yield
end

assert{HouseCalculator.fetch_house("Film-noir") == "Ravenclaw"}
assert{HouseCalculator.fetch_house("Crime") == "Slytherin"}


test_genres1 = ["Action", "Comedy", "Sci-fi"]
assert{HouseCalculator.select_house_from_genres(test_genres1) == "Gryffindor"}

test_genres2 = ["Western", "Comedy"]
test_houses2 = ["Hufflepuff", "Gryffindor"]
assert{test_houses2.include?(HouseCalculator.select_house_from_genres(test_genres2))}
