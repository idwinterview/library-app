require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'validations' do
    it { should validate_presence_of :number }
    it { should validate_presence_of :street }
    it { should validate_presence_of :zip }
    it { should validate_presence_of :state }
  end

  describe 'relationship' do

  end
end
