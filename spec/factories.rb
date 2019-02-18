FactoryBot.define do
  factory :customer, class: Customer do
    first_name "John"
    last_name  "Doe"
    email_address "john@example.com"
    password "test1"
  end

  factory :customer_book  do
    status "checked out"
  end

  factory :book do
    sequence(:title) { |n| "book-title-#{n}" }
    isbn "ABC1112233"
    author "Jane Smith"
    category "Fiction"
  end

  factory :audio_book, class: AudioBook do
    sequence(:title) { |n| "audiobook-title-#{n}" }
    isbn "XXXX144444"
    author "Jane Smith"
    category "Non Fiction"
  end

  factory :physical_book, class: PhysicalBook do
    sequence(:title) { |n| "physicalbook-title-#{n}" }
    isbn "ZZZZ9999"
    author "Jane Hero"
    category "Non Fiction"
  end

  factory :user do
    first_name "Hank"
    last_name  "Hill"
    email_address "hank@example.com"
    password "propane"
    type "Customer"
  end

  factory :librarian, class: Librarian do
    first_name "Grace"
    last_name  "Hopper"
    email_address "grace@example.com"
    password "bookworm"
  end
end
