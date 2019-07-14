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
    asteroids_by_day_data = service.asteroids_by_day_data(start_date, end_date)
    days = asteroids_by_day_data.map do |day_data|
      Day.new(day_data)
    end

    days.max_by{|day|  day.asteroids.length}
  end

  private

  attr_reader :start_date, :end_date

  def service
    NasaService.new
  end
end
