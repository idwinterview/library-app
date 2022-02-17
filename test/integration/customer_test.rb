require "test_helper"
require 'mocha/mini_test'

class CustomerViewTest < ActionDispatch::IntegrationTest
  context 'Books list' do
    context "'Librarian View'" do
      should 'not be viewable as a Customer' do
        customer = create(:customer)

        get '/books/list', params: {user_id: customer.id}

        assert_equal(response.body.include?("Librarian View"), false)
      end
    end
  end
end
