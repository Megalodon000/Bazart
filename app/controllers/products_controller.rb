class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

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

    if @product.save!
      flash[:success] = "Product Created Successfully"
      redirect_to "/products/#{product.id}"
    else
      flash[:warning] = "Product Not Created"
      redirect_to "/products/new"
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update

  end

  def destroy
    @product = Product.destroy
    redirect_to "/products"
  end


  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :price, :description, :collection, :material, :color)
  end

end
