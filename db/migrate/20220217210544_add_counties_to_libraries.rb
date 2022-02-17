class AddCountiesToLibraries < ActiveRecord::Migration[6.1]
  def change
    add_reference :libraries, :county, foreign_key: true
  end
end
