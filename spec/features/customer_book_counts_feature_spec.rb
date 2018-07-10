require 'rails_helper'

feature "report of customer's type of books counts" do
  scenario 'display counts' do
    customer1 = FactoryBot.create(:customer)
    FactoryBot.create(:customer_book, customer_id: customer1.id, book_id: FactoryBot.create(:book).id)

    customer2 = FactoryBot.create(:customer, first_name: 'Mary')
    FactoryBot.create(:audio_book, customer_id: customer2.id)
    FactoryBot.create(:audio_book, customer_id: customer2.id)
    FactoryBot.create(:physical_book, customer_id: customer2.id)
    FactoryBot.create(:physical_book, customer_id: customer2.id)
    FactoryBot.create(:physical_book, customer_id: customer2.id)

    visit customer_book_counts_path
save_and_open_page
    expect(page).to have_content(customer1.customer_books.count)
    expect(page).to have_content(customer2.audio_books.count)
    expect(page).to have_content(customer2.physical_books.count)
  end
end