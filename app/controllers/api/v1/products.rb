module API
  module V1
    class Products < Grape::API
      version 'v1'
      format :json
 
      resource :products do
        desc "Return list of recent products"
        get do
          Product.all
        end
        desc "Return a product"
        # params do
        #   requires :id, type: String, desc: "ID of the 
        #     product"
        # end
        get ":id", root: "product" do
          Product.where(id: params[:id]).first!
        end
      end
    end
  end
end