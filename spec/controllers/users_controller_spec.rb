require "rails_helper"

RSpec.describe UsersController do
  context "#show" do
    it "renders the correct template" do
      customer = create(:customer)
      allow(controller).to receive(:current_user).and_return(customer)

      get :show, id: customer.id

      expect(response).to render_template(:show)
    end
  end
end