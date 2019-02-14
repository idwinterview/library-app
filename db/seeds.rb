Librarian.create({first_name: 'Mrs', last_name: 'Books'})
mr_incredible = Customer.create({first_name: 'Mr', last_name: 'Incredible'})
mrs_incredible = Customer.create({first_name: 'Mrs', last_name: 'Incredible'})

rails = PhysicalBook.create(isbn: '0470081201', title: "Ruby on Rails For Dummies", author: 'Barry A. Burd', category: 'technology')
javascript = AudioBook.create(isbn: '0764506331', title: 'JavaScript For Dummies', author: 'Emily A. Vander Veer', category: 'technology')
harry_potter = PhysicalBook.create(isbn: '0439708184', title: "Harry Potter and the Sorcerer's Stone", author: 'J.K. Rowling', category: 'fantasy')

mr_incredible.books << [javascript, harry_potter]
mrs_incredible.books << rails
