require 'rails_helper'

RSpec.describe County, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :zip_code }
  end

  describe 'relationships' do
    it { should have_many :libraries }
  end
end
