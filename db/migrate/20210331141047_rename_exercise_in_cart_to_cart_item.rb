class RenameExerciseInCartToCartItem < ActiveRecord::Migration[6.1]
  def change
    rename_table :exercise_in_carts, :cart_items
  end
end
