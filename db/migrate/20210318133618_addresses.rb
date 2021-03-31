class Addresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |table|
      table.integer :user_id
      table.integer :house_number
      table.string :colony
      table.string :street
      table.string :city
      table.string :state
    end    
  end
end
