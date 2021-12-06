class MtnRange < ApplicationRecord
  has_many :mountains, dependent: :destroy

  validates :natl_park_land, inclusion: [true, false]
  validates_presence_of :name
  validates_presence_of :drivetime

  def self.most_recent_first
    self.order("created_at DESC")
  end

  def mountain_count
    self.mountains.count
  end

  def elevation_threshold(num)
    self.mountains.where("elevation > #{num}")
  end

end