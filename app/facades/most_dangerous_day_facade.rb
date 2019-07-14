class MostDangerousDayFacade
  def initialize(start_date, end_date)
    @start_date = start_date.to_datetime.strftime('%F')
    @end_date = end_date.to_datetime.strftime('%F')
  end

  def search_range
    "#{start_date.to_s.to_datetime.strftime('%B%e, %Y')} - #{end_date.to_s.to_datetime.strftime('%B%e, %Y')}"
  end

  def asteroids_for_day
    most_dangerous_day.asteroids
  end

  def most_dangerous_day
    conn = Faraday.new(url: 'https://api.nasa.gov') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params['api_key'] = ENV['NASA_KEY']
    end

    response = conn.get('/neo/rest/v1/feed') do |req|
      req.params['start_date'] = start_date
      req.params['end_date'] = end_date
    end

    asteroids_by_day_data = JSON.parse(response.body, symbolize_names: true)[:near_earth_objects]
    days = asteroids_by_day_data.map do |day_data|
      Day.new(day_data)
    end

    days.max_by{|day|  day.asteroids.length}
  end

  private

  attr_reader :start_date, :end_date
end
