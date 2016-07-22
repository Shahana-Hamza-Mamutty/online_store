class Order < ActiveRecord::Base
	# has_many :products, :through => :order_products
	# has_many :order_products
	# belongs_to :user
	# belongs_to :cart
	belongs_to :user
	has_many :cart_products
end
