class CreateproductsTable < ActiveRecord::Migration[7.0]
  def change
  create_table :products do |product|
      t.integer :ids
      t.string :names
      t.integer :unavailable_delivery_ids, array: true, default: []
      t.timestamps    
  end
end
