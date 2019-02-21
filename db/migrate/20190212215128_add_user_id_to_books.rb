class AddUserIdToBooks < ActiveRecord::Migration
  def change
    change_table :books do |t|
      t.references :user
    end
  end
end
