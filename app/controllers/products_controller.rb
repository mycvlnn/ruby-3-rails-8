# Controller for managing Product resources.
#
# Actions:
# - index: Lists all products.
# - show: Displays a specific product by ID.
# - create: Creates a new product with permitted parameters.
#
# Private Methods:
# - product_params: Strong parameters for product creation (name, description, price).
class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def show
    @product = Product.find(params[:id])
  end

   def new
    @product = Product.new
   end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Hàm để lấy các tham số hợp lệ cho sản phẩm
  # Chỉ cho phép các trường name, description và price
  def product_params
    puts "Received product parameters: #{params.inspect}"
       params.require(:product).permit(:name, :description, :price)
  end
end
