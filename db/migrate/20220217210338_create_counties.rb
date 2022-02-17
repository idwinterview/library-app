class CreateCounties < ActiveRecord::Migration[6.1]
  def change
    create_table :counties do |t|
      t.string :name
      t.string :zip_code

      t.timestamps
    end
  end
end
