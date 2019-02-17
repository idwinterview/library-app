require "rails_helper"

RSpec.describe User, type: :model do
  describe "#downcase_type" do
    it "makes the string lowercase" do
      user = create(:user)

      expect(user.downcase_type).to eq("customer")
    end
  end
end