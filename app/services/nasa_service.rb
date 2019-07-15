class NasaService
  def asteroids_by_day_data(start_date, end_date)
    response = astroids_by_date(start_date, end_date)
    JSON.parse(response.body, symbolize_names: true)[:near_earth_objects]
  end

  private

  def astroids_by_date(start_date, end_date)
    conn.get('/neo/rest/v1/feed') do |req|
      req.params['start_date'] = start_date
      req.params['end_date'] = end_date
    end
  end

  def conn
    Faraday.new(url: 'https://api.nasa.gov') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params['api_key'] = ENV['NASA_KEY']
    end
  end
end
