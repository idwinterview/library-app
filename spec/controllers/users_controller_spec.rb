require 'rails_helper'

describe UsersController do
  before :all do
    @customer = create(:customer)
  end

  context "#index" do
    it "renders the correct template" do
      get :index

      expect(response).to render_template(:index)
    end
  end

  context "#list" do
    before :each do
      get :list
    end

    it "renders the correct template" do
      expect(response).to render_template(:list)
    end

    it "assign customers" do
      customers = assigns :customers
      result = customers.include?(@customer)

      expect(result).to be_truthy
    end

    it "assigns view" do
      expect(assigns(:view)).to eql('librarian')
    end
  end

  context "#show" do
    # Could do this type of thing with before statements much more to save
    # object creation where it isn't necessary (and also save lines of code)
    before :all do
      @customer = create(:customer)
    end

    before :each do
      get :show, id: @customer.id
    end

    it "renders the correct template" do
      expect(response).to render_template(:show)
    end

    it "assigns customer" do
      expect(assigns(:customer).id).to eql(@customer.id)
    end

    it "assigns view" do
      expect(assigns(:view)).to eql('customer')
    end
  end
end
