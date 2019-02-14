require 'rails_helper'

describe UsersController do
  context "#index" do
    it "renders the correct template" do
      create(:customer)

      get :index

      expect(response).to render_template(:index)
    end
  end

  context "#list" do
    it "renders the correct template" do
      create(:customer)

      get :list

      expect(response).to render_template(:list)
    end

    it "assign customers" do
      customer = create(:customer)

      get :list

      customers = assigns :customers
      result = customers.include?(customer)

      expect(result).to be_truthy
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
