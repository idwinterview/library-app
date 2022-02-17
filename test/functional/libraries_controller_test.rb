# frozen_string_literal: true

require 'test_helper'

class LibrariesControllerTest < ActionController::TestCase
  context '#index' do
    should 'render the correct template' do
      library = create(:library)
      create(:customer)

      get :index, params: { library_id: library.id, view: 'customer' }

      assert_template :index
    end
  end
end
