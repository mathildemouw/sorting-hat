class House
  class << self
    attr_reader :house_names
  end

  @house_names = ["Gryffindor", "Slytherin", "Hufflepuff", "Ravenclaw"]

  def describe_house
    #TODO for a given house, list out the genres that it has from the csv
  end
end