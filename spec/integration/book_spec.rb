require 'rails_helper'

RSpec.describe 'BookList' do
  it 'should navigate to book show page' do
    customer = Customer.create!(first_name: "George", last_name: "Hammel")
    book = Book.create!(type: "", isbn: 2222, title: "The Book", author: "The Author", category: "Non-fiction")
    CustomerBook.create!(user_id: customer.id, book_id: book.id)

    visit('/books/list')

    click_on("#{book.title}")
    expect(current_path).to eq("/books/#{book.id}")
  end
end
