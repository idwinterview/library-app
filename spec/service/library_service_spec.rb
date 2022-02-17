require 'rails_helper'

RSpec.describe LibraryService, type: :service do
  describe 'methods' do
    describe '#find_book()' do
      it 'valid book id' do
        book = Book.create!(isbn: 222, title: 'New Book', author: 'George Hammy', category: 'Fiction', description: 'Great book!')
        expect(LibraryService.find_book(book.id)).to be_a(Book)
      end

      it 'invalid book id' do
        expect(LibraryService.find_book(2)).to eq('Book not found')
      end
    end
  end
end
