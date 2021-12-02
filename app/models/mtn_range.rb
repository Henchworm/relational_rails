class MtnRange < ApplicationRecord
  has_many :mountains

  validates :natl_park_land, inclusion: [true, false]
  validates_presence_of :name
  validates_presence_of :drivetime

end