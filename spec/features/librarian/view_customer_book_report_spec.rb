require "rails_helper"

RSpec.describe "Librarian can view customer book report" do
  it "shows report of customers and count of their books" do
    librarian = create(:librarian)
    customer = create(:customer)
    audio_book = create(:audio_book)
    physical_book = create(:physical_book)
    create(:customer_book, customer_id: customer.id, book_id: audio_book.id)
    create(:customer_book, customer_id: customer.id, book_id: physical_book.id)

    visit sign_in_path

    fill_in("Email address", with: librarian.email_address)
    fill_in("Password", with: librarian.password)
    click_on("Submit")

    visit customer_books_report_librarian_users_path

    within '.rowA' do
      expect(page).to have_content(audio_book.title)
      expect(page).to have_content(physical_book.title)
      expect(page).to have_content(1)
    end
  end
end