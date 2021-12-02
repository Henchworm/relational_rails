class Park < ApplicationRecord
  has_many :hikes
  validates :ocean_access, inclusion: [true, false]
  validates_presence_of :name
  validates_presence_of :entrance_fee
end
