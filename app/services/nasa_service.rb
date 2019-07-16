class NasaService
  def asteroids_by_day_data(start_date, end_date)
    response = asteroids_by_date(start_date, end_date)
    JSON.parse(response.body, symbolize_names: true)[:near_earth_objects]
  end

  def find_asteroid(neo_id)
    response = asteroid_by_id(neo_id)
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def asteroids_by_date(start_date, end_date)
    conn.get('/neo/rest/v1/feed') do |req|
      req.params['start_date'] = start_date
      req.params['end_date'] = end_date
    end
  end

  def asteroid_by_id(neo_id)
    conn.get("/neo/rest/v1/neo/#{neo_id}")
  end

  def conn
    Faraday.new(url: 'https://api.nasa.gov') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params['api_key'] = ENV['NASA_KEY']
    end
  end
end
