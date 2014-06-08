require 'json'

get '/' do
  erb :index
end

post '/house' do
  results = HouseCalculator.calculate_total_house_points(params)
  results.to_json
end
