require 'rails_helper'
require Rails.root.join('./spec/support/shared_examples.rb').to_s

describe AudioBook do
  it_behaves_like :book, using_factory: :audio_book
end
