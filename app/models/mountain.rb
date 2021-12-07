class Mountain < ApplicationRecord
  belongs_to :mtn_range

  validates_presence_of :name
  validates_presence_of :elevation
  validates :safe_winter_route, inclusion: [true, false]

  def self.true_only
    Mountain.where(safe_winter_route: "true")
  end
end