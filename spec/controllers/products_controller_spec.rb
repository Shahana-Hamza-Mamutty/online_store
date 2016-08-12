
require 'rails_helper'

describe ProductsController do

	describe 'GET #index' do
		context 'gets category lists' do
			it "populates an array of contacts starting with the letter" do 
				category_1 = FactoryGirl.create(:category, name: "Foot wear")
				category_2 = FactoryGirl.create(:category, name: "Dress")
				get :index
				expect(assigns(:categories)).to match_array([category_1, category_2])
			end
			it "renders the :index template" do 
				get :index
				expect(response).to render_template :index
			end
		end

	end

	describe 'GET #show' do
		it "assigns the requested product to @product" do
			product = FactoryGirl.create(:product, name: "Test", price: 58 )
			get :show, id: product
			expect(assigns(:product)).to eq product
		end
		it "renders the :show template" do
			product = FactoryGirl.create(:product, name: "Test 2", price: 58 )
			get :show, id: product
			expect(response).to render_template :show
		end
	end

	describe "POST #create" do
		context "with valid attributes" do
			it "saves the new product in the database" do 
				expect{post :create, product: FactoryGirl.attributes_for(:product)}.to change(Product, :count).by(1)
			end
			it "redirects to productss#show" do 
				post :create, product: FactoryGirl.attributes_for(:product)
				expect(response).to redirect_to products_path
			end
		end
	end

	describe 'PATCH #update' do
		before :each do
		  @product = FactoryGirl.create(:product, name: 'nike', price: 4000)
		end
		context "with valid attributes" do
			it "locates the requested product " do 
				patch :update, id: @product , product: FactoryGirl.attributes_for(:product)
				expect(assigns(:product)).to eq @product
			end
			it "changes @product's attributes" do 
				patch :update, id: @product, product: FactoryGirl.attributes_for(:product, name: 'Addidas', price: 8000)
				@product.reload
				expect(@product.name).to eq('Addidas')
				expect(@product.price).to eq(8000.0)
			end

			it "redirects to the products index" do
			  patch :update, id: @product , product: FactoryGirl.attributes_for(:product)
			  expect(response).to redirect_to products_path
			end
		end
	end

	describe 'DELETE #destroy' do
		before :each do
			@product = FactoryGirl.create(:product)
		end

		it "deletes the product" do
			expect{delete :destroy, id: @product}.to change(Product,:count).by(-1)
		end

		it "redirects to products#index" do
			delete :destroy, id: @product
			expect(response).to redirect_to products_path
		end
	 end
end