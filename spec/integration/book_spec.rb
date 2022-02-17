# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'BookList' do
  describe 'as a customer' do
    it "clicking on a books' title should navigate to book show page" do
      customer = Customer.create!(first_name: 'George', last_name: 'Hammel')
      book = Book.create!(type: '', isbn: 2222, title: 'The Book', author: 'The Author', category: 'Non-fiction')
      CustomerBook.create!(user_id: customer.id, book_id: book.id)

      visit('/books/list')

      click_on(book.title.to_s)
      expect(current_path).to eq("/books/#{book.id}")
    end
  end

  describe 'as a librarian' do
    it 'should display all books' do
    end
  end
end
