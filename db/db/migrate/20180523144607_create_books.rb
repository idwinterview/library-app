class CreateBooks < ActiveRecord::Migration
  def up
    create_table :books, :force => true do |t|
      t.column :type, :string, limit: 20
      t.column :isbn, :integer
      t.column :title, :string, limit: 50
      t.column :author, :string, limit: 50
      t.column :category, :string, limit: 50
      t.timestamps
    end
  end

  def down
    drop_table :books
  end
end
