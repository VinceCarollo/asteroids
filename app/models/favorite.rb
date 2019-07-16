class Favorite < ApplicationRecord
  belongs_to :user
  has_one :favorite_asteroid

  after_create :asteroid_info

  def asteroid_info
    data = NasaService.new.find_asteroid(self.neo_reference_id)
    self.name = data[:name]
    self.is_potentially_hazardous_asteroid = data[:is_potentially_hazardous_asteroid]
    save
  end
end
