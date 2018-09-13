require "test_helper"

class UsersControllerTest < ActionController::TestCase
  context "#index" do 
    should "render the correct template" do 
      create(:customer)

      get :index 

      assert_template :index
    end
  end

  context "#list" do 
    should "render the correct template" do 
      create(:customer)

      get :list

      assert_template :list
    end

    should "assign customers" do 
      create(:customer)

      get :list 

      assert assigns(:customers)
    end
  end

  context "#show" do 
    should "render the correct template" do 
      customer = create(:customer)

      get :show, id: customer.id

      assert_template :show
    end
  end
end
