# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'BookList' do
  def create_book
    isbn = Faker::PhoneNumber.phone_number.gsub(/-/, '')[0..5].to_i
    title = Faker::Job.title
    author = Faker::Name.first_name + " " + Faker::Name.last_name
    category = %w[Non-fiction Fiction Biographical].shuffle.first
    description = Faker::Lorem.sentence
    Book.create!(type: '', isbn: isbn, title: title, author: author, category: category, description: description)
  end

  describe 'as a customer' do
    it "clicking on a books' title should navigate to book show page" do
      customer = Customer.create!(first_name: 'George', last_name: 'Hammel')
      book = create_book
      CustomerBook.create!(user_id: customer.id, book_id: book.id)
      visit('/books/list')

      click_on(book.title.to_s)
      expect(current_path).to eq("/books/#{book.id}")
    end
  end

  describe 'as a librarian' do
    it 'should display all books' do
      librarian = Librarian.create!(first_name: "Linda", last_name: "Hammel")
      customer = Customer.create!(first_name: "George", last_name: "Yipp")
      books = []
      5.times do
        books << create_book
      end
      books.each { |book| CustomerBook.create!(user_id: customer.id, book_id: book.id) }
      visit('/books/list')

      books.each do |book|
        expect(page).to have_content(book.title)
      end
    end
  end
end
