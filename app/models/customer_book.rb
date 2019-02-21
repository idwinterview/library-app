class CustomerBook < ActiveRecord::Base
  belongs_to :customer
  belongs_to :bookable, polymorphic: true
end
