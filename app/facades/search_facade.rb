class SearchFacade

  def stations
    
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => 'https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end


end