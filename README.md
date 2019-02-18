## Introduction

*   The purpose of this application is to showcase your technical, analytical, written and verbal skills.
*   Once your system has been configured, please spend an hour reviewing, enhancing, pseudo-coding, coding and/or commenting on the application. Feel free to spend more than an hour, but it is not required.
*   Your code changes, enhancements and/or comments will be used as the starting point of a technical discussion with the team. It will be a unstructured format that will focus on the entire stack.

## Application Overview:

This application displays the relationship between a customer and a library. It includes 8 models:

1.  User
2.  Librarian
3.  Customer
4.  Library
5.  Book
6.	AudioBook
7.	PhysicalBook
8.	CustomerBook

The db/seeds.rb file is preloaded with test data. Please use this when you setup your DB.

## Suggested Tasks:

*		Review the code for best practices, efficiencies or logic flaws.
*		Review the test suite for any gaps.
*		Build a new report that lists customers with a count of different types of books.
*		Build an import process to retrieve new books from a file.
*		Build a process to review new books and deliver then to the customer.

## Extra Credit:

*		Review and/or update the code for any potenial security issues.
*		Review and/or update the code for any performance related changes.
*		Enhance the usability and/or design.

## Project Setup

Clone this repo locally, and from the top-level directory run:

`bundle install`

`bundle exec rake db:setup`

To make sure it's all working,

`rails s`

You should see this same information.

## Project Review

Please commit any updates and/or comments to the repo. Add any additional comments, notes and/or instructions in the README under the "Enhancements" section. Also note if the db/seeds.rb file has been updated. The development team will review your submission and be ready for the technical portion of your interview.

## Enhancements

The db/seeds.rb file has been updated to include additional fields for users.

### Test Suite

The test suite was updated to use rspec.

Run the following from the root of the project in your terminal to run all tests

`bundle exec rspec ./spec`

To run a single test file use the following format

`bundle exec rspec ./spec/models/user_spec.rb`

### Associations

The associations were updated between a Customer and Books/AudioBooks/PhysicalBooks to complete the has many through association that is joined on the CustomerBooks table.

### Authentication/Authorization

A sign in process was added for the seeded users (there is currently no functionality to create an account client-side). After signing in, customers are taken to their show view that displays their books. Librarians are taken to the Librarian Dashboard, which serves as an admin dashboard. Helper methods were created to help enforce authorization in the controllers and keep customers from wandering to pages they should not have access to.

### Customer Book Report

A simple report was made (Customer Book Report) that is viewable by librarians through their dashboard that lists customers with a count of their different types of books.

### Book Feed

An import process was created to retrieve new books from a file. It gets some filler/Lorem Ipsum type json data from this [endpoint](https://jsonplaceholder.typicode.com/users). The objects in this file are labled as users but I'm creating books out of them in this scenario. New books are created from that data if they do not have a title identical to one in the database. Books pulled from that file also show up under the new book feed on the homepage of the site.

### Book Reviews

Functionality was added so that a user can write reviews for all the books in the database. On the side navbar clicking on 'Books' will take you to the book index. Clicking on a book title will take you to that book's show view, where a user can leave a review for the book.