class HouseCalculator

  def self.count_house_frequency(genre_array)
    @frequency_collector = {
      "Ravenclaw" => 0,
      "Hufflepuff" => 0,
      "Slytherin" => 0,
      "Gryffindor" => 0
    }

    genre_array.each do |genre|
      frequency_collector[fetch_house(genre)] += 1
    end
    #return the point structure collection (points per house)
  end

  def self.fetch_house(genre)
    #return the house from csv
  end

  def self.select_one_house
    #takes points across many houses and returns the one with the most points
  end
end