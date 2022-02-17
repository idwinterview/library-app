require 'rails_helper'

RSpec.describe Library, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :phone_number }
    it { should validate_uniqueness_of :phone_number }
  end

  describe 'relationships' do
    it { should have_one :address }
    it { should have_many :books }
    it { should have_many :customers }
    it { should have_many :librarians }
    it { should have_many :physical_books }
    it { should have_many :customer_books }
    it { should have_many :audio_books }
  end
end
