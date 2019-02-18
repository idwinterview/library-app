require "rails_helper"

RSpec.describe "User sign in form" do
  context "with valid customer credentials" do
    it "enables a user to sign in" do
      customer = create(:customer)

      visit "/"
      click_on "Sign In"

      expect(current_path).to eq(sign_in_path)

      fill_in("Email address", with: customer.email_address)
      fill_in("Password", with: customer.password)
      click_on("Submit")

      expect(current_path).to eq(user_path(customer))
      expect(page).to have_content("Welcome #{customer.first_name} #{customer.last_name}!")
    end
  end

  context "with valid librarian credentials" do
    it "enables a user to sign in" do
      librarian = create(:librarian)

      visit "/"
      click_on "Sign In"

      expect(current_path).to eq(sign_in_path)

      fill_in("Email address", with: librarian.email_address)
      fill_in("Password", with: librarian.password)
      click_on("Submit")

      expect(current_path).to eq(librarian_dashboard_path)
      expect(page).to have_content("Welcome #{librarian.first_name} #{librarian.last_name}!")
    end
  end

  context "with invalid credentials" do
    it "displays an error message" do
      user = create(:user)

      visit sign_in_path

      fill_in("Email address", with: user.email_address)
      fill_in("Password", with: "wrongpassword")
      click_on("Submit")

      expect(current_path).to eq(sign_in_path)
      expect(page).to have_content("Incorrect Credentials.")
    end
  end
end