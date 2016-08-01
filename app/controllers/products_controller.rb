class ProductsController < ApplicationController
	# before_action :authenticate_user!
	def index
		@categories = Category.all
	end

	def new
		@product = Product.new
		@cat = [["Select One", ""]]
		Category.all.each do |cat|
			@cat << [cat.name, cat.id]
		end

	end

	def create
		@product = Product.create(name: params[:product][:name], product_details: params[:product][:product_details], category_id: params[:product][:category_id], price: params[:product][:price])
		if @product
			redirect_to products_path
		else
			new_product_path
		end
	end

	def edit
		@cat = [["Select One", ""]]
		Category.all.each do |cat|
			@cat << [cat.name, cat.id]
		end
		@product = Product.find params[:id]
		
	end

	def update
		product = Product.find params[:id]
		@product = product.update_attributes(name: params[:product][:name], product_details: params[:product][:product_details], category_id: params[:product][:category_id], price: params[:product][:price])
		if @product
			redirect_to products_path
		else
			product_path(:id => @product)
		end
	end

	def show
		@product = Product.find(params[:id])
	end

end
