# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
  end

  describe 'relationships' do
    it { should have_many :customer_books }
    it { should have_many(:books).through(:customer_books) }
  end

  describe 'methods' do
    it '#define_user()' do
      customer = Customer.create!(first_name: 'George', last_name: 'Hammel')
      librarian = Librarian.create!(first_name: 'Hammy', last_name: 'Todd')

      expect(User.define_user(customer.id)).to be_a(Customer)
      expect(User.define_user(librarian.id)).to be_a(Librarian)
    end
  end
end
