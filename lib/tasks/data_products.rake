namespace :data_products do
	desc "categories"
	task :create_categories => :environment do
		Category.where(name: "Clothing Men").first_or_create
		Category.where(name: "Clothing Women").first_or_create
		Category.where(name: "Accessories").first_or_create
		Category.where(name: "Footwear").first_or_create
	end

  desc "Products"
  task :create_products => :environment do
  	a = Category.find_by_name "Clothing Men"
  	b = Category.find_by_name "Clothing Women"
  	c = Category.find_by_name "Accessories"
  	d = Category.find_by_name "Footwear"

  	Product.where(name: "Product 1").first_or_create!(category_id: a.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  	Product.where(name: "Product 2").first_or_create!(category_id: a.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  	Product.where(name: "Product 3").first_or_create!(category_id: a.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  	Product.where(name: "Product 4").first_or_create!(category_id: a.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  	Product.where(name: "Product 5").first_or_create!(category_id: a.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  	Product.where(name: "Product 6").first_or_create!(category_id: b.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  	Product.where(name: "Product 7").first_or_create!(category_id: b.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  	Product.where(name: "Product 8").first_or_create!(category_id: b.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  	Product.where(name: "Product 9").first_or_create!(category_id: b.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  	Product.where(name: "Product 10").first_or_create!(category_id: b.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  	Product.where(name: "Product 11").first_or_create!(category_id: c.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  	Product.where(name: "Product 12").first_or_create!(category_id: c.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  	Product.where(name: "Product 13").first_or_create!(category_id: c.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  	Product.where(name: "Product 14").first_or_create!(category_id: c.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  	Product.where(name: "Product 15").first_or_create!(category_id: c.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  	Product.where(name: "Product 16").first_or_create!(category_id: d.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  	Product.where(name: "Product 17").first_or_create!(category_id: d.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  	Product.where(name: "Product 18").first_or_create!(category_id: d.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  	Product.where(name: "Product 19").first_or_create!(category_id: d.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  	Product.where(name: "Product 20").first_or_create!(category_id: d.id, product_details: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 1000)
  end

end