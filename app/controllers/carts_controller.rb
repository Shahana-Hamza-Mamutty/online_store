class CartsController < ApplicationController
  def show
    @cart = Cart.find params[:id]
    @products = @cart.products
  end

  def add_to_cart
  	cart = Cart.find params[:id]
  	product = Product.find params[:product_id]
  	cart_product = CartProduct.where('cart_id = ? and product_id = ?', cart.id, product.id ).first
  	if cart_product.present?
  		quant = cart_product.quantity + 1
  		price = quant * product.price
  		cart_product.update_attributes(quantity: quant, price: price)
  	else
  		quantity = 1;
  		cart.cart_products.create(product_id: product.id, quantity: quantity, price: quantity*product.price, status: "active" )
  	end
  	cart_count = cart.cart_products.sum(:quantity)
  	render text: "cart(#{cart_count})"
  end
end
