require 'rails_helper'

describe Product do
	it "returns a products's full name as a string" do
	  product = Product.new(name: 'John', price: 33)
	  expect(product.price_name).to eq 'John 33.0'
	end

	it "returns a sorted array of results that match" do
		smith = Product.create(name: 'smith')
		jones = Product.create(name: 'jones')
		johnson = Product.create(name: 'johnson')
		expect(Product.by_letter("j")).to eq [johnson, jones]
	end

	it "returns a contact's full name as a string" do
	  product = FactoryGirl.create(:product, name: "Test", price: 58 )
	  expect(product.price_name).to eq 'Test 58.0'
	end
# remaining examples to come
end