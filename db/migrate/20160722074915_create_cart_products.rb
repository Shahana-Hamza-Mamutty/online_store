class CreateCartProducts < ActiveRecord::Migration
  def change
    create_table :cart_products do |t|
    	t.integer :cart_id
    	t.integer :product_id
    	t.integer :order_id
    	t.integer :quantity
    	t.float :price
    	t.string :status
      t.timestamps null: false
    end
  end
end
