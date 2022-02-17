# frozen_string_literal: true

class CustomerBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
end
