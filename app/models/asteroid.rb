class Asteroid
  attr_reader :dangerous, :name, :neo_id
  def initialize(data)
    @dangerous = data[:is_potentially_hazardous_asteroid]
    @name = data[:name]
    @neo_id = data[:neo_reference_id]
  end
end
