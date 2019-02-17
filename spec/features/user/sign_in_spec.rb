require "rails_helper"

RSpec.describe "User sign in form" do
  context "with valid credentials" do
    it "enables a user to sign in" do
      user = create(:user)

      visit "/"
      click_on "Sign In"

      expect(current_path).to eq(sign_in_path)

      fill_in("Email address", with: user.email_address)
      fill_in("Password", with: user.password)
      click_on("Submit")

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome #{user.first_name} #{user.last_name}!")
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