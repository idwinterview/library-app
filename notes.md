# Notes

## Setup

1. Postgresql database wouldn't link to app. Had to change database.yml file.

2. Added Capybara, Pry, Shoulda-Matchers, RSpec and Rubocop gems.



## Changes

1. Used both Test Case & RSpec for testing.

2. Added 'Description' to `Book`, with default value of 'No description yet'. Nice feature to have with books, I commonly see a description or summary when I look at libraries online. Plus, it gives the Book's show page more content.

3. Added a show page for `Book`, as well as made the book titles on the list of books in '/books/list' links to their respective show page.

4. Changed attribute 'customer_id' to 'user_id' in `customer_books` table. Had issues creating relationship between `Customer` and `Book`, this solved it. Isn't ideal to change an attribute in a table.

5. 

## Comments

- Haven't used Minitest in a long time, never used Test Case, never used Mocha.

- Not ideal to have two different testing suites, but I didn't want to spend too much time on re-learning Minitest, RSpec is what I use on a weekly basis.

-
