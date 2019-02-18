require 'rails_helper'

RSpec.describe "Add Review" do
  it "user can add review to book" do
      user = create(:user)
      book = create(:book)

      visit book_path(book)

      expect(page).to_not have_content("Best book I ever read!")

      fill_in "review[body]", with: "Best book I ever read!"
      click_on "Submit"

      expect(page).to have_content("Best book I ever read!")
  end
end