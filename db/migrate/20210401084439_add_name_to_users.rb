class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |table|
      table.string :first_name
      table.string :last_name
      table.date :dob
    end
  end
end
