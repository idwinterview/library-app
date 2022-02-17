class County < ActiveRecord::Base
  validates_presence_of :name, :zip_code
  validates_uniqueness_of :name
  has_many :libraries
  has_many :books, through: :libraries
end
