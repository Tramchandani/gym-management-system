class Carts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |table|
      table.integer :user_id
    end
  end
end
