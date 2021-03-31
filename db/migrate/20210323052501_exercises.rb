class Exercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |table|
      table.string :name
      table.float :price
      table.text :description
    end
  end
end
