class CartsController < ApplicationController
  def show
    @cart = Cart.find params[:id]
    @products = @cart.products.joins(:cart_products).where('cart_products.status != ?', "purchased")
    @total = @cart.cart_products.where("status != ?", "purchased").sum(:price)
  end

  def add_to_cart
  	cart = Cart.find params[:id]
  	product = Product.find params[:product_id]
  	cart_product = CartProduct.where('cart_id = ? and product_id = ? and status != ?', cart.id, product.id, "purchased" ).first
  	if cart_product.present?
  		quant = cart_product.quantity + 1
  		price = quant * product.price
  		cart_product.update_attributes(quantity: quant, price: price)
  	else
  		quantity = 1;
  		cart.cart_products.create(product_id: product.id, quantity: quantity, price: quantity*product.price, status: "active" )
  	end
  	cart_count = cart.cart_products.where('cart_products.status != ?', "purchased").sum(:quantity)
  	render text: "cart(#{cart_count})"
  end

  def edit_cart
    cart = Cart.find params[:id]
    product = Product.find params[:product_id]
    cart_product = CartProduct.where('cart_id = ? and product_id = ? and status != ?', cart.id, product.id, "purchased" ).first
    if params[:condition] == "quantity"
      cart_product.update_attributes(:quantity => params[:quantity], :price => params[:quantity].to_i*product.price)
    else
      cart_product.destroy
    end
    cart_count = cart.cart_products.where('status != ?', "purchased").sum(:quantity)
    cart_total = cart.cart_products.where('status != ?', "purchased").sum(:price)
    render :json => { :attachmentPartial => render_to_string('carts/_product', :layout => false, :locals => { :product => product, :cart => cart }),:cartCount => cart_count, :cartTotal => cart_total }
  end

end
