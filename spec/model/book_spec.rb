require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'relationships' do
    it { should have_many :customer_books }
    it { should have_many(:users).through(:customer_books) }
  end
end
