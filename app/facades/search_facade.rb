class SearchFacade

  def initialize(location)
    @location = location
  end

  def stations
    @stations ||= get_json[:fuel_stations]
    binding.pry
  end
  
  # def fetch_stations_response
  #   get_json("&location=#{@location}")
  # end
  
  def get_json
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => 'https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json') do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params["api_key"] = ENV["API_KEY"]
      faraday.params["location"] = @location
    end

  end
end