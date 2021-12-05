class Hike < ApplicationRecord
  belongs_to :park

  validates_presence_of :name
  validates_presence_of :mileage
  validates :water_on_route, inclusion: [true, false]
  validates_presence_of :elevation_gain
end
