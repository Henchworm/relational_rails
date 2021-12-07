class Park < ApplicationRecord
  has_many :hikes, dependent: :destroy
  validates :ocean_access, inclusion: [true, false]
  validates_presence_of :name
  validates_presence_of :entrance_fee

  def self.most_recent_first
    self.order("created_at DESC")
  end

  def hike_count
    self.hikes.count
  end

  def hikes_by_name
    self.hikes.order(:name)
  end

  def mileage_threshold(number)
    self.hikes.where("mileage > #{number}")
  end
end
