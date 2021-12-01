class Range < ApplicationRecord
  has_many :mountains

  # # validates_presence_of :name
  # validates_presence_of :accessibility
  # validates_presence_of :natl_park_land
  # validates_presence_of :drivetime
end

