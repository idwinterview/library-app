require "rails_helper"

RSpec.describe "User can sign out" do
  context "user is signed in" do
    it "enables a user to sign out" do
      user = create(:user)

      visit sign_in_path

      fill_in("Email address", with: user.email_address)
      fill_in("Password", with: user.password)
      click_on("Submit")

      expect(current_path).to eq(user_path(user))

      click_on("Sign Out")

      expect(page).to have_content("Signed Out")
      expect(current_path).to eq('/')
    end
  end
end