class InvoiceItems < ActiveRecord::Migration[6.1]
  def change
    create_table :invoice_items do |table|
      table.integer :invoice_id
      table.integer :exercise_id
      table.float :price
    end
  end
end
