class AddLibrariesToBooks < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :library, foreign_key: true
  end
end
