class User < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :email_address, :password_digest

  has_secure_password

  def downcase_type
    type.downcase
  end

  def librarian?
    type == "Librarian"
  end
end