require 'rails_helper'

feature 'root librarian flow' do
  it 'lists customers with book count after clicking Librarian View' do
    customers = create_list(:customer, 3)
    customers.first.books << create_list(:book, 2)
    customers.second.books << create_list(:book, 3)
    customers.third.books << create(:book)

    visit home_path
    click_link_or_button('Librarian View')

    customers.each_with_index do |customer, i|
      expect(page).to have_content(customer.first_name)
      expect(page).to have_content(customer.last_name)
      expect(page).to have_css("tr.customer-id-#{customers[i].id}",
        text: "#{customers[i].books.length}")
    end
  end

  # TODO
  xit "it doesn't crash with no customers" do
    Customer.destroy_all
    visit home_path
  end

end
