class Park < ApplicationRecord
  has_many :hikes

  validates_presence_of :name
  validates_presence_of :entrance_fee
  validates_presence_of :ocean_access 
end
