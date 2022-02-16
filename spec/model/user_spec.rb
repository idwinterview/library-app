require "rails_helper"

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
  end

  describe 'relationships' do
    it { should have_many :customer_books }
    it { should have_many(:books).through(:customer_books) }
  end
end
