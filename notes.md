# Notes

## Setup

1. Postgresql database wouldn't link to app. Had to change database.yml file.

2. Added Capybara, Pry, Shoulda-Matchers, RSpec and Rubocop gems.



## Changes

1. Used both Test Case & RSpec for testing.

2. Added 'Description' to `Book`, with default value of 'No description yet'. Nice feature to have with books, I commonly see a description or summary when I look at libraries online. Plus, it gives the Book's show page more content.

3. Added a show page for `Book`, as well as made the book titles on the list of books in '/books/list' links to their respective show page.

4. Changed attribute 'customer_id' to 'user_id' in `customer_books` table. Had issues creating relationship between `Customer` and `Book`, this solved it. Isn't ideal to change an attribute in a table.

5. Added foreign keys `books` and `users` references for `customer_books`.

6. Added functionality in controller, allowing a librarian to see _all_ `CustomerBook`'s in '/books/list'

7. Added `define_user()` method for `User`. Method takes in an ID and searches `User`, rather than `Librarian` or `Customer`. This was added because the previous method in the `BooksController` only searched `Customer`. This allows for the eventual feature of allowing a librarian to see _all_ books that are being used by customers, as well as limiting the views a customer can see.

8. Added a `LibraryService` class to abstract the function of finding and returning a book, as well as delivering a flash message.

9. Added a `Library` model. The library has a name, phone number, customers, books, an address and librarians.

10. Added an `Address` model for `Library`

11. Added landing page, displays library's name.

## Nice to have's

1. ~Tie `Book` to `Library`~
2. Login page
3. Landing page
4. ~Library home page~
5. Page to see all books, as a librarian, and their status
6. ~Add `County`, tie each `Library` to a `County`~
7. ~Give `Library` an address~
8. ~Create `Address`, tie it to `Library`~

## Comments

- I named the branch 'refactor', which was true at first but not as I continued to make improvements / changes. Typically I'd submit one PR for the refactoring, then make another branch for each of the other features. This is assuming I'd be using feature branching, rather than trunk based development.

- Haven't used Minitest in a long time, never used Test Case, never used Mocha.

- Not ideal to have two different testing suites, but I didn't want to spend too much time on re-learning Minitest, RSpec is what I use on a weekly basis.

- There was a typo on the README.rdoc, I fixed it.

- I used Rubocop as a guide for following best practices. It's never meant as a crutch, but it is nice to have.
