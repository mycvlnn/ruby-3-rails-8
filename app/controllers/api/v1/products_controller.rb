module Api
  module V1
    class ProductsController < BaseController
      before_action :validate_product_params, only: [ :create ]
      before_action :set_product, only: [ :show, :update ]

      def index
        render json: Product.all
      end

      def show
        render json: @product
      end

      def create
        product = Product.new(product_params)
        if product.save
          render json: product, status: :ok
        else
          render_model_errors(product)
        end
      end

      def update
        if @product.update(product_params)
          render json: @product, status: :ok
        else
          render_model_errors(@product)
        end
      end

      private

      def product_params
        params.require(:product).permit(:name, :description, :price)
      end

      def set_product
        @product = Product.find(params[:id])
      end

      def validate_product_params
        errors = []
        name = product_params[:name]
        description = product_params[:description]
        price = product_params[:price]
        errors << { field: "name", message: "Name cannot be blank", code: "blank" } if name.blank?
        errors << { field: "description", message: "Description cannot be blank", code: "blank" } if description.blank?
        errors << { field: "price", message: "Price must be a number", code: "not_a_number" } unless price.is_a?(Numeric)

        render json: { errors: errors }, status: :unprocessable_entity and return if errors.any?
      end

      def render_model_errors(model)
        custom_error = format_model_errors(model)
        render json: { errors: custom_error }, status: :unprocessable_entity
      end
    end
  end
end
