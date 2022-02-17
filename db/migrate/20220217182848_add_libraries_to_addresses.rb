class AddLibrariesToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_reference :addresses, :library, foreign_key: true
  end
end
