class Users::RegistrationsController < Devise::RegistrationsController
	def new
		super
	end

	def create
		build_resource(sign_up_params)
		role = Role.find_by_name "customer"
		resource.role_id = role.id
		if resource.save
			Cart.create(:user_id => resource.id)
			redirect_to after_sign_in_path_for(resource)
		end	
	end
end