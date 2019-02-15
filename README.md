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

* Upgraded to Rails 4
    * Removed deprecated config statements
    * Incorporated strong params in both controllers
    * Made other small changes as needed to get the app to spin up
* Removed minitest
* Added rspec, capybara, and launchy
* Added bullet (n+1 detection)
* Added simplecov for test coverage checking
* Played with style a little
    * Used Bootstrap 4 via CDN
    * Didn't get too crazy -- kept same css file, did not make it scss
    * If I were actually using bootstrap outside of a quick demo project like this:
        * Would pull into the app asset flow via a gem or otherwise
        * Would use scss files (would do this anyway on a rails project)
        * Would override bootstrap properly instead of working my way around it (note the hacky use of a "selected" class for the side nav instead of the default "active" class to be able to use a different background color).
    * Kept views the same, but smoothed them up a bit
    * Added a check-in feature
* Shored up test coverage
* Broke the books up into audio and physical for the librarian view display
* Tweaked factories a little to add some uniqueness to generated attributes

General theme is that I cleaned things up, versus totally redesign them. Left the front end flows, left the controller flows. The front end work is quick and dirty... I'd much prefer to do it all in a framework. And even in lieu of a framework, it still wouldn't have all the html and partial reloads, instead, favoring json and piece-meal refreshing. But, I wanted to have a little fun with it, just the same.

Thanks for the project, and I look forward to talking it through.
