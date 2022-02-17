class AddLibrariesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :library, foreign_key: true
  end
end
