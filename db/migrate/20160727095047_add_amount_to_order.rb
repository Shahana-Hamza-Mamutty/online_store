class AddAmountToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :amount, :float
  end
end
