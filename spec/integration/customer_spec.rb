# require 'rails_helper'
#
# RSpec.describe Book, type: :feature do
#   describe '/books/list' do
#     describe "should only see 'Librarian view' if a librarian" do
#       it 'as a user' do
#         customer = Customer.create!(first_name: "George", last_name: "Hammel")
#         book = Book.create!(type: "", isbn: 2222, title: "The Book", author: "The Author", category: "Non-fiction")
#         CustomerBook.create!(user_id: customer.id, book_id: book.id)
#
#         require "pry"; binding.pry
#       end
#     end
#   end
# end
