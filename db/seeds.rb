# frozen_string_literal: true
county = County.create!(name: 'Jefferson County', zip_code: '99988')
library = Library.create!(name: 'Bear Creek Library', phone_number: '222-333-1234', county_id: county.id)

Address.create!(number: '123', street: 'South Road', second_address_line: '#203', zip: 99988, state: 'NY', library_id: library.id)

Librarian.create({ first_name: 'Mrs', last_name: 'Books', library_id: library.id })
mr_incredible = Customer.create({ first_name: 'Mr', last_name: 'Incredible', library_id: library.id })
mrs_incredible = Customer.create({ first_name: 'Mrs', last_name: 'Incredible', library_id: library.id })

rails = PhysicalBook.create(isbn: '0470081201', title: 'Ruby on Rails For Dummies', author: 'Barry A. Burd',
                            category: 'technology', library_id: library.id)
javascript = AudioBook.create(isbn: '0764506331', title: 'JavaScript For Dummies', author: 'Emily A. Vander Veer',
                              category: 'technology', library_id: library.id)
harry_potter = PhysicalBook.create(isbn: '0439708184', title: "Harry Potter and the Sorcerer's Stone",
                                   author: 'J.K. Rowling', category: 'fantasy', library_id: library.id)

CustomerBook.create(user_id: mrs_incredible.id, book_id: rails.id, library_id: library.id)
CustomerBook.create(user_id: mr_incredible.id, book_id: javascript.id, library_id: library.id)
CustomerBook.create(user_id: mr_incredible.id, book_id: harry_potter.id, library_id: library.id)
require "pry"; binding.pry
