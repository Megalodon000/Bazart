class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @products = Product.all

    if params[:search].present?
      @products = @products.where("title ILIKE ?", "%#{params[:search]}%")
    end

    if params[:collection].present?
      @products = @products.where(collection: params[:collection])
    elsif params[:material].present?
      @products = @products.where(material: params[:material])
    elsif params[:color].present?
      @products = @products.where(color: params[:color])
    end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.craftman = current_user
    if @product.save!
      redirect_to product_path(@product.id)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    if @product.update(product_params)
      flash[:success] = "Product Updated Successfully"
      redirect_to "/products/#{product.id}"
    else
      flash[:warning] = "Product Not Updated"
      redirect_to "/products/#{product.id}/edit"
    end
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
    params.require(:product).permit(:title, :price, :description, :collection, :material, :color, :photo)
  end
end
