class Day
  attr_reader :date
  def initialize(data)
    @date = data.first.to_s.to_datetime.strftime('%B%e, %Y')
    @asteroid_data = data.last
  end

  def asteroids
    @asteroids ||= @asteroid_data.map do |data|
      Asteroid.new(data) if data[:is_potentially_hazardous_asteroid]
    end.compact
  end
end
