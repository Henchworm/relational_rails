require 'rails_helper'

describe MtnRange do

  describe 'relationships' do
    xit { should have_many(:mountains) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:natl_park_land) }
    it { should validate_presence_of(:drivetime) }
  end
end