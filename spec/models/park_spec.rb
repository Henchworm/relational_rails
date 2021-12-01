require 'rails_helper'

describe Park do
  describe 'relationships' do
    it { should have_many(:hikes) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :entrance_fee }
    it { should validate_presence_of :ocean_access }
  end
end
