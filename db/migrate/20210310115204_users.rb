class Users < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |table|
      table.string :first_name
      table.string :last_name
      table.date :dob
      table.string :email
      table.string :password_digest
    end
  end
end
