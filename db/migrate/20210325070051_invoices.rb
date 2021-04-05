class Invoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |table|
      table.integer :user_id
      table.float :amount
    end
  end
end
