FactoryBot.define do
  factory :customer, class: Customer do
    sequence(:first_name) { |n| "John_#{n}"}
    sequence(:last_name) { |n| "Doe_#{n}" }
  end

  factory :customer_book  do
    status { "checked out" }
  end

  factory :book do
    sequence(:title) { |n| "A Fancy Title #{n}"}
    sequence(:isbn) { |n| "ABC" + (1112233 + n).to_s }
    sequence(:author) { |n| "Jane Smith #{n}"}
    category { "Fiction" }
  end

  factory :audio_book, class: AudioBook do
    title { "A Fancy Audio Book" }
    isbn { "XXXX144444" }
    author { "Jane Smith" }
    category { "Non Fiction" }
  end

  factory :physical_book, class: PhysicalBook do
    title { "A Physical Books" }
    isbn { "ZZZZ9999" }
    author { "Jane Hero" }
    category { "Non Fiction" }
  end
end
