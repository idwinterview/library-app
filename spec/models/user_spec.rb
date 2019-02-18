require "rails_helper"

RSpec.describe User, type: :model do
  describe "#downcase_type" do
    it "makes the string lowercase" do
      user = create(:user)

      expect(user.downcase_type).to eq("customer")
    end
  end

  describe "#librarian?" do
    context "user type librarian" do
      it "checks if user is a librarian" do
        librarian = create(:librarian, type: "Librarian")

        expect(librarian.librarian?).to be(true)
      end
    end

    context "user type customer" do
      it "checks if user is a librarian" do
        customer = create(:customer)

        expect(customer.librarian?).to be(false)
      end
    end
  end
end
