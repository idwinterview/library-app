require 'rails_helper'
require Rails.root.join('./spec/support/shared_examples.rb').to_s

describe Book do
  it_behaves_like :book, using_factory: :book
end
