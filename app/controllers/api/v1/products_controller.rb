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

      def create
        product = Product.new(product_params)
        if product.save
          render json: product, status: :ok
        else
            render json: { errors: product.errors.details }, status: :unprocessable_entity
        end
      end
      # Định nghĩa các phương thức private
      private
      # Strong parameters for product creation
      def product_params
        params.require(:product).permit(:name, :description, :price)
      end
    end
  end
end
