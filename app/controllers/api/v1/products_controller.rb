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
          custom_error = format_model_errors(product)
          render json: { errors: custom_error }, status: :unprocessable_entity
        end
      end

      private

      # Strong parameters for product creation
      def product_params
        params.require(:product).permit(:name, :description, :price)
      end

      def format_model_errors(model)
        model.errors.map do |error|
          {
            field: error.attribute,
            message: error.message,
            code: error.type
          }
        end
      end
    end
  end
end
