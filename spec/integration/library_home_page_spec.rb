require 'rails_helper'

RSpec.describe 'Library home page' do
  describe 'content' do
    it 'should include a welcome message' do
      library = Library.create!(name: 'Aspen Park', phone_number: '222-3333')

      visit("/libraries/#{library.id}")
      expect(page).to have_content("Welcome to the #{library.name} library!")
    end
  end
end
