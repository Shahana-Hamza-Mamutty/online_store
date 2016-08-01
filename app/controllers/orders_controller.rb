class OrdersController < ApplicationController
	before_action :authenticate_user!

	def new
		gon.client_token = generate_client_token
		@total = current_user.cart.cart_products.where("status != ?", "purchased").sum(:price)
	end

	def create
		# unless current_user.has_payment_info?
	  #   @result = Braintree::Transaction.sale(
	  #               amount: 1,
	  #               payment_method_nonce: params[:payment_method_nonce],
	  #               customer: {
	  #                 first_name: params[:first_name],
	  #                 last_name: params[:last_name],
	  #                 company: params[:company],
	  #                 email: current_user.email,
	  #                 phone: params[:phone]
	  #               },
	  #               options: {
	  #                 store_in_vault: true
	  #               })
	  # else
	    @result = Braintree::Transaction.sale(
	                amount: 1,
	                payment_method_nonce: params[:payment_method_nonce])
	  # end
    if @result.success?
      current_user.orders.create(amount: current_user.cart.cart_products.sum(:price))
      current_user.cart.cart_products.update_all(:status => "purchased")
      redirect_to root_url, notice: "Congraulations! Your transaction has been successfully finished!"
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      render :new
    end
	end

	private
		def generate_client_token
		  # if current_user.has_payment_info?
		  #   Braintree::ClientToken.generate(customer_id: current_user.braintree_customer_id)
		  # else
		    Braintree::ClientToken.generate
		  # end
		end
end
