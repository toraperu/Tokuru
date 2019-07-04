class ProductsController < ApplicationController
  def index
    @genres = Genre.all
    @products = Product.all.order(id: "DESC")
  end

  def new
    @product = Product.new
    @genres = Genre.all
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    @product.save
    redirect_to root_path
  end

  def about
  end

  def show
  end

  def edit
  end

  def update
  end


  private

  def product_params
    params.require(:product).permit(:name, :body, :jacket_image, :price, :genre_id)
  end


end
