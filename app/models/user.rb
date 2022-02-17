# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many(:customer_books, dependent: :destroy)
  has_many :books, through: :customer_books
  has_many(:audio_books)
  has_many(:physical_books)
  validates_presence_of :first_name, :last_name

  def self.define_user(id)
    if id
      User.find(id)
    else
      User.where("type NOT like 'Librarian'").first
    end
  end
end
