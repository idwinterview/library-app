require 'rails_helper'

RSpec.describe County, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :zip_code }
    it { should validate_uniqueness_of :name }
  end

  describe 'relationships' do
    it { should have_many :libraries }
    it { should have_many(:books).through(:libraries)}
  end
end
