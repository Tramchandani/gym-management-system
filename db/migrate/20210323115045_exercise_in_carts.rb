class ExerciseInCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :exercise_in_carts do |table|
      table.integer :cart_id
      table.integer :exercise_id
    end
  end
end
