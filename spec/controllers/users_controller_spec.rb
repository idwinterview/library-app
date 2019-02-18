require "rails_helper"

RSpec.describe UsersController do
  context "#list" do
    it "renders the correct template" do
      create(:customer)

      get :list

      expect(response).to render_template(:list)
    end

    it "assigns customers" do
      create(:customer)

      get :list

      expect(assigns(:customers)).to eq(Customer.all)
    end
  end

  context "#show" do
    it "renders the correct template" do
      customer = create(:customer)

      get :show, id: customer.id

      expect(response).to render_template(:show)
    end
  end
end