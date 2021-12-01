require 'rails_helper'

describe Hike do
  describe 'relationships' do
    it { should belong_to(:park) }
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :mileage}
    it { should validate_presence_of :elevation_gain}
    it { should validate_presence_of :water_on_route}
  end
end
