require 'rails_helper'

feature 'Customer show page' do
  it 'can check in the book' do
    customer = create :customer
    customer.books << create_list(:book, 2)

    visit user_path(id: customer.id, view: 'customer')

    book = customer.books.first
    expect(page).to have_content(book.title)
    expect(page).to have_content(book.author)
  end
end
