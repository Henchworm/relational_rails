class Hike < ApplicationRecord
  belongs_to :park

  validates_presence_of :name
  validates_presence_of :mileage
  validates :water_on_route, inclusion: [true, false]
  validates_presence_of :elevation_gain

  def self.true_only
    Hike.where(water_on_route: "true")
  end

end
