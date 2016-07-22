class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :name
    	t.integer :category_id, foreign_key: true
      t.text :product_details
      t.float :price
      t.timestamps null: false
    end
  end
end
