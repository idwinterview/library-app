# frozen_string_literal: true

require 'test_helper'

class LibrariesControllerTest < ActionController::TestCase
  context '#show' do
    should 'render the correct template' do
      library = create(:library)
      create(:customer)

      get :show, params: { library_id: library.id, view: 'customer' }

      assert_template :show
    end
  end
end
