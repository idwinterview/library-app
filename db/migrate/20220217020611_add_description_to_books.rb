# frozen_string_literal: true

class AddDescriptionToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :description, :text, default: 'No description yet'
  end
end
