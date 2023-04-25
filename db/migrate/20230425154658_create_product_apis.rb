class CreateProductApis < ActiveRecord::Migration[7.0]
  def change
    create_table :product_apis do |t|

      t.timestamps
    end
  end
end
