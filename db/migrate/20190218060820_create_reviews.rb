class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :author_name
      t.text :body
      t.references :book
      t.timestamps
    end
  end
end
