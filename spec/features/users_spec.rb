require 'rails_helper'

feature 'User management' do
	scenario "user log in" do
		# admin = create(:admin)


		role = FactoryGirl.create(:role, :name => "customer")
		user = FactoryGirl.create(:user, :email => "shahanamamutty@gmail.com", :password => "shahana7", :role_id => role.id)
		visit root_path
		click_link 'Login'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		find('input[name="commit"]').click

		expect(current_path).to eq products_path
	end
end