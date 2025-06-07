module Api
  module V1
    class ProductsController < BaseController
      def index
        render json: Product.all
      end

      def show
        product = Product.find(params[:id])
        render json: product
      end
    end
  end
end
