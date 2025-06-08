class ProductsController < ApplicationController
  before_action :set_product, only: [ :show, :edit, :update ]

  def index
    @products = Product.all
  end

  def show
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

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to products_path, alert: "Product not found."
  end
end
