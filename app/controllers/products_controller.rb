class ProductsController < ApplicationController
  def index
    @genres = Genre.all
    @products = Product.all.order(id: "DESC").page(params[:page]).per(6)
  end

  def test
    @products = Product.all.page(params[:page]).per(3)
  end

  def search_list
    @products = Product.search(params[:search])
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
    @product = Product.find(params[:id])
    @comments = Comment.all
  end

  def edit
    @genres = Genre.all
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "編集内容を更新しました"
      redirect_to root_path
    else
      render :"/products/edit"
    end
  end


  private

  def product_params
    params.require(:product).permit(:name, :body, :jacket_image,
                                    :price, :genre_id, :finish,
                                    :sale_result, :caution)
  end



end
