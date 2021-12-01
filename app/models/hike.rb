class Hike < ApplicationRecord
  belongs_to :park

  validates_presence_of :name
  validates_presence_of :mileage
  validates_presence_of :elevation_gain
  validates_presence_of :water_on_route
end
