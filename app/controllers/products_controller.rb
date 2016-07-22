class ProductsController < ApplicationController
	# before_action :authenticate_user!
	def index
		@categories = Category.all
	end

	def show
		@product = Product.find(params[:id])
	end

end
