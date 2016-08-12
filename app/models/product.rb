class Product < ActiveRecord::Base
	# belongs_to :category
	# has_many :orders, :through => :order_products
	# has_many :order_products


	has_many :carts, :through => :cart_products
	has_many :cart_products
	
	def price_name
	  [name, price].join(' ')
	end

	def self.by_letter(letter)
	  where("name LIKE ?", "#{letter}%").order(:name)
	end
end
