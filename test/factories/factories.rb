# frozen_string_literal: true

$LOAD_PATH << "#{File.dirname(__FILE__)}/.."

require 'factory_bot'
require 'faker'

FactoryBot.define do
  factory :customer, class: Customer do |c|
    c.first_name { 'John' }
    c.last_name  { 'Doe' }
  end

  factory :librarian, class: Librarian do |c|
    c.first_name { Faker::Name.first_name }
    c.last_name { Faker::Name.last_name }
  end

  factory :customer_book do |cb|
    cb.status { 'checked out' }
  end

  factory :book do |b|
    b.title { 'A Fancy Title' }
    b.isbn { 'ABC1112233' }
    b.author { 'Jane Smith' }
    b.category { 'Fiction' }
  end

  factory :audio_book, class: AudioBook do |ab|
    ab.title { 'A Fancy Audio Book' }
    ab.isbn { 'XXXX144444' }
    ab.author { 'Jane Smith' }
    ab.category { 'Non Fiction' }
  end

  factory :physical_book, class: PhysicalBook do |pb|
    pb.title { 'A Physical Books' }
    pb.isbn { 'ZZZZ9999' }
    pb.author { 'Jane Hero' }
    pb.category { 'Non Fiction' }
  end
end
