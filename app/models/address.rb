class Address < ActiveRecord::Base
  validates_presence_of :street, :number, :zip, :state
end
